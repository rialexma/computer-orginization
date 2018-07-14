#include <stdio.h>

#define MAXSIZE 4096

int matches_leading(char *partial_line, char *pattern) {




    while (pattern[0] != '\0')
    {  
        switch (pattern[0])
        { 

            case '+': //matches character more than once
                while(matches_leading(partial_line, pattern-1))
                    partial_line++;
                pattern++;    
                break; 

            case '.':
                partial_line++;
                pattern++;
                break;

            case '\\':
                pattern++;

            default:
                // Match '?'
                if (pattern[1] == '?' && pattern[0] == partial_line[0]) {
                    pattern += 2;
                    partial_line++;
                }
                else if (pattern[1] == '?')
                    pattern += 2;

                // Match regular
                if (pattern[0] == partial_line[0]){
                    partial_line++;
                    pattern++;
                }

                // Pattern mismatch
                else
                {
                    return 0;
                }
        }
    }

    if (pattern[0] == '\0' && partial_line[0] == '\n')
        return 1;
    if (partial_line[0] == '\0' || partial_line[0] == '\n')
        return 0;

    return 1;
}

int rgrep_matches(char *line, char *pattern) {

    while (line[0] != '\0')
    {
        if (matches_leading(line, pattern))
            return 1;
        else
            line++;
    }
    return 0;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <PATTERN>\n", argv[0]);
        return 2;
    }

    /* we're not going to worry about long lines */
    char buf[MAXSIZE];

    while (!feof(stdin) && !ferror(stdin)) {
        if (!fgets(buf, sizeof(buf), stdin)) {
            break;
        }
        if (rgrep_matches(buf, argv[1])) {
            fputs(buf, stdout);
            fflush(stdout);
        }
    }

    if (ferror(stdin)) {
        perror(argv[0]);
        return 1;
    }

    return 0;
}


