![Uploading image.png…]()
# AES-128 Verification Documentation

## Project Title

**Verification of AES-128 Encryption Core using SystemVerilog**

## Objective

To verify the functionality of the AES-128 encryption core by applying test vectors and comparing the generated ciphertext with the expected AES output.

## Verification Environment

The verification environment consists of:

* Interface (`aes_interface.sv`)
* Driver (`driver.sv`)
* Monitor (`monitor.sv`)
* Scoreboard (`scoreboard.sv`)
* Environment (`environment.sv`)
* Test (`test.sv`)
* DUT (`AES_128Core`)

## Verification Flow

1. Test generates plaintext and key values.
2. Driver applies inputs to the DUT through the interface.
3. AES core performs encryption.
4. Monitor captures DUT outputs.
5. Scoreboard compares actual and expected ciphertext.
6. Results are reported as PASS or FAIL.

## Simulation Results

**Simulation Time:** 5 µs

**Latency:** 320000 ns

**Scoreboard Report:**

* PASS Count = 10
* FAIL Count = 0

## Verification Status

✅ All test cases passed

✅ No mismatches detected

✅ AES-128 functionality verified successfully

## Conclusion

The AES-128 encryption core was successfully verified using a SystemVerilog-based verification environment. All 10 test cases passed with zero failures, confirming that the DUT produces the correct ciphertext for the applied test vectors.
