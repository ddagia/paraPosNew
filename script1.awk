#!/usr/bin/awk -f

{
    # count f(...) factors in this line
    nf = gsub(/f\([^)]*\)/, "&")

    if (nf == 2 || nf == 3) {
        factors = ""
        tmp = $0

        # extract f(...) factors
        while (match(tmp, /f\([^)]*\)/)) {
            fac = substr(tmp, RSTART, RLENGTH)
            factors = factors fac " "
            tmp = substr(tmp, RSTART+RLENGTH)
        }

        # normalize by sorting
        n = split(factors, arr)
        asort(arr)
        key = ""
        for (i = 1; i <= n; i++) key = key arr[i] " "

        # now extract l-momenta
        tmp = $0
        while (match(tmp, /p[0-9]+\.l/)) {
            pl = substr(tmp, RSTART, RLENGTH)
            lmap[nf][key][pl] = 1
            tmp = substr(tmp, RSTART+RLENGTH)
        }
    }
}

END {
    # check triples
    for (k in lmap[3]) {
        count = 0
        plist = ""
        for (p in lmap[3][k]) {
            count++
            plist = plist p " "
        }
        if (count > 1) {
            print "Triple:", k, "has multiple .l:", plist
        }
    }

    # check doubles
    for (k in lmap[2]) {
        count = 0
        plist = ""
        for (p in lmap[2][k]) {
            count++
            plist = plist p " "
        }
        if (count > 2) {
            print "Double:", k, "has more than 2 .l:", plist
        }
    }
}

