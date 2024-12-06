
######################################################################################
# This scripts runs all four traces
# You will need to first compile your code in ../src before launching this script
# the results are stored in the ../results/ folder 
######################################################################################



########## ---------------  A.1 ---------------- ################

echo "Testing A1 on bzip2..."
../src/sim -pipewidth 1 ../traces/bzip2.ptr.gz > ../results/A1.bzip2.res 
echo "Testing A1 on gcc..."
../src/sim -pipewidth 1 ../traces/gcc.ptr.gz   > ../results/A1.gcc.res 
echo "Testing A1 on libq..."
../src/sim -pipewidth 1 ../traces/libq.ptr.gz  > ../results/A1.libq.res 
echo "Testing A1 on mcf..."
../src/sim -pipewidth 1 ../traces/mcf.ptr.gz   > ../results/A1.mcf.res

########## ---------------  A.2 ---------------- ################

echo "Testing A2 on bzip2..."
../src/sim -pipewidth 2 ../traces/bzip2.ptr.gz > ../results/A2.bzip2.res 
echo "Testing A2 on gcc..."
../src/sim -pipewidth 2 ../traces/gcc.ptr.gz   > ../results/A2.gcc.res 
echo "Testing A2 on libq..."
../src/sim -pipewidth 2 ../traces/libq.ptr.gz  > ../results/A2.libq.res 
echo "Testing A2 on mcf..."
../src/sim -pipewidth 2 ../traces/mcf.ptr.gz   > ../results/A2.mcf.res

########## ---------------  A3 ---------------- ################

echo "Testing A3 on bzip2..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd ../traces/bzip2.ptr.gz > ../results/A3.bzip2.res 
echo "Testing A3 on gcc..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd ../traces/gcc.ptr.gz   > ../results/A3.gcc.res 
echo "Testing A3 on libq..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd ../traces/libq.ptr.gz  > ../results/A3.libq.res 
echo "Testing A3 on mcf..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd ../traces/mcf.ptr.gz   > ../results/A3.mcf.res

########## ---------------  B1 ---------------- ################

echo "Testing B1 on bzip2..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 1 ../traces/bzip2.ptr.gz > ../results/B1.bzip2.res 
echo "Testing B1 on gcc..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 1 ../traces/gcc.ptr.gz   > ../results/B1.gcc.res 
echo "Testing B1 on libq..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 1 ../traces/libq.ptr.gz  > ../results/B1.libq.res 
echo "Testing B1 on mcf..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 1 ../traces/mcf.ptr.gz   > ../results/B1.mcf.res

########## ---------------  B2 ---------------- ################

echo "Testing B2 on bzip2..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 2 ../traces/bzip2.ptr.gz > ../results/B2.bzip2.res 
echo "Testing B2 on gcc..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 2 ../traces/gcc.ptr.gz   > ../results/B2.gcc.res 
echo "Testing B2 on libq..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 2 ../traces/libq.ptr.gz  > ../results/B2.libq.res 
echo "Testing B2 on mcf..."
../src/sim -pipewidth 2 -enablememfwd -enableexefwd -bpredpolicy 2 ../traces/mcf.ptr.gz  > ../results/B2.mcf.res

########## ---------------  GenReport ---------------- ################

grep LAB2_CPI ../results/A?.*.res > report.txt
grep LAB2_CPI ../results/B?.*.res >> report.txt
grep LAB2_MISPRED_RATE ../results/B?.*.res >> report.txt

######### ------- Goodbye -------- ##################

echo "Done. Check report.txt, and .res files in ../results";

