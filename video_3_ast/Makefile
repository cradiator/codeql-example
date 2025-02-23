output_db:
	codeql database create output_db --language=cpp --command='make main.o'

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:
	-rm -f main.o
	-rm -rf output_db