// --------------------------------------------------------------------- //
// For part B, you will need to modify this file.                        //
// You may add any code you need, as long as you correctly implement the //
// three required BPred methods already listed in this file.             //
// --------------------------------------------------------------------- //

// bpred.cpp
// Implements the branch predictor class.

#include "bpred.h"
#include <cstdio>
#include <cstring>

/**
 * Construct a branch predictor with the given policy.
 * 
 * In part B of the lab, you must implement this constructor.
 * 
 * @param policy the policy this branch predictor should use
 */
BPred::BPred(BPredPolicy policy)
{
    // TODO: Initialize member variables here.
    if(policy == 0)
    {
        BPred::policy = BPRED_PERFECT;
    }
    else if(policy == 1)
    {
        BPred::policy = BPRED_ALWAYS_TAKEN;
    }
    else if(policy == 2)
    {
        BPred::policy = BPRED_GSHARE;
    }
    stat_num_branches = 0;
    stat_num_mispred = 0;
    GHR = 0;
    std::memset(PHT, 2, sizeof(PHT));
    //max_counter = 3;
    // As a reminder, you can declare any additional member variables you need
    // in the BPred class in bpred.h and initialize them here.
}

/**
 * Get a prediction for the branch with the given address.
 * 
 * In part B of the lab, you must implement this method.
 * 
 * @param pc the address (program counter) of the branch to predict
 * @return the prediction for whether the branch is taken or not taken
 */
BranchDirection BPred::predict(uint64_t pc)
{
    // TODO: Return a prediction for whether the branch at address pc will be
    // TAKEN or NOT_TAKEN according to this branch predictor's policy.

    // Note that you do not have to handle the BPRED_PERFECT policy here; this
    // function will not be called for that policy.

    if(policy == BPRED_ALWAYS_TAKEN)
    {
        return TAKEN;
    }
    if(policy == BPRED_GSHARE)
    {
        uint64_t index = (GHR & 0xFFF) ^ (pc & 0xFFF);

        if(PHT[index] > 1)
            return TAKEN;
        else
            return NOT_TAKEN;
    }
    else
        return TAKEN; // This is just a placeholder.
}


/**
 * Update the branch predictor statistics (stat_num_branches and
 * stat_num_mispred), as well as any other internal state you may need to
 * update in the branch predictor.
 * 
 * In part B of the lab, you must implement this method.
 * 
 * @param pc the address (program counter) of the branch
 * @param prediction the prediction made by the branch predictor
 * @param resolution the actual outcome of the branch
 */
void BPred::update(uint64_t pc, BranchDirection prediction,
                   BranchDirection resolution)
{
    // TODO: Update the stat_num_branches and stat_num_mispred member variables
    // according to the prediction and resolution of the branch.
    stat_num_branches++;
    if(prediction != resolution)
        stat_num_mispred++;

    // TODO: Update any other internal state you may need to keep track of.
    if(policy == BPRED_GSHARE)
    {
        uint64_t index = (GHR & 0xFFF) ^ (pc & 0xFFF);
        if(resolution == TAKEN)
            PHT[index] = sat_increment(PHT[index], 3);
        else
            PHT[index] = sat_decrement(PHT[index]);
        GHR = GHR << 1;
        GHR = GHR + resolution;

    }
        
    // Note that you do not have to handle the BPRED_PERFECT policy here; this
    // function will not be called for that policy.
}
