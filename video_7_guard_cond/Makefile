SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

output_db:
	codeql database create output_db --language=cpp --command='make main.o'

output_db2:
	codeql database create output_db2 --language=cpp --command='make main2.o'

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(OBJS)

clean:
	-rm -f $(OBJS)
	-rm -rf output_db
