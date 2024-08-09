size_of_ptr.o: size_of_ptr.c
	clang -c -o size_of_ptr.o size_of_ptr.c

clean:
	-rm -rf *.o output_db

db: clean
	codeql database create --language=cpp --command=make output_db
