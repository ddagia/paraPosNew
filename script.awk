#!/usr/bin/awk -f

{
    # collect all f(...) factors in this line
    nf = gsub(/f\([^)]*\)/, "&")
    if (nf == 3) {
        triple = ""
        # extract f(...) one by one and store sorted
        while (match($0, /f\([^)]*\)/)) {
            fac = substr($0, RSTART, RLENGTH)
            triple = triple fac " "
            $0 = substr($0, RSTART+RLENGTH)   # move forward
        }
        # sort factors inside triple for consistency
        n = split(triple, arr)
        asort(arr)
        key = arr[1] " " arr[2] " " arr[3]

        # now collect p?.l if present
        while (match($0, /p[0-9]+\.l/)) {
            pl = substr($0, RSTART, RLENGTH)
            lmap[key][pl] = 2
            $0 = substr($0, RSTART+RLENGTH)
        }
    }
}

END {
    for (k in lmap) {
        count = 0
        plist = ""
        for (p in lmap[k]) {
            count++
            plist = plist p " "
        }
        if (count > 1) {
            print "Double:", k, "has multiple .l:", plist
        }
    }
}

