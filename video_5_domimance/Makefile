output_db:
	codeql database create output_db --language=cpp --command='make main.o'

output_db2:
	codeql database create output_db2 --language=cpp --command='make main2.o'

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

main2.o: main2.c
	$(CC) $(CFLAGS) -c main2.c

clean:
	-rm -f main.o main2.o
	-rm -rf output_db output_db2