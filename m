From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0164/1529] Fix typo
Date: Sat, 21 May 2016 13:57:39 +0200
Message-ID: <20160521115739.8325-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/ifpsp060/src/fpsp.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/ifpsp060/src/fpsp.S b/arch/m68k/ifpsp060/src/fpsp.S
index 78cb60f..9bbffeb 100644
--- a/arch/m68k/ifpsp060/src/fpsp.S
+++ b/arch/m68k/ifpsp060/src/fpsp.S
@@ -10191,7 +10191,7 @@ xdnrm_con:
 xdnrm_sd:
 	mov.l		%a1,-(%sp)
 	tst.b		LOCAL_EX(%a0)		# is denorm pos or neg?
-	smi.b		%d1			# set d0 accodingly
+	smi.b		%d1			# set d0 accordingly
 	bsr.l		unf_sub
 	mov.l		(%sp)+,%a1
 xdnrm_exit:
@@ -10990,7 +10990,7 @@ src_qnan_m:
 # routines where an instruction is selected by an index into
 # a large jump table corresponding to a given instruction which
 # has been decoded. Flow continues here where we now decode
-# further accoding to the source operand type.
+# further according to the source operand type.
 #
 
 	global		fsinh
@@ -23196,14 +23196,14 @@ m_sign:
 #
 #  1. Branch on the sign of the adjusted exponent.
 #  2p.(positive exp)
-#   2. Check M16 and the digits in lwords 2 and 3 in decending order.
+#   2. Check M16 and the digits in lwords 2 and 3 in descending order.
 #   3. Add one for each zero encountered until a non-zero digit.
 #   4. Subtract the count from the exp.
 #   5. Check if the exp has crossed zero in #3 above; make the exp abs
 #	   and set SE.
 #	6. Multiply the mantissa by 10**count.
 #  2n.(negative exp)
-#   2. Check the digits in lwords 3 and 2 in decending order.
+#   2. Check the digits in lwords 3 and 2 in descending order.
 #   3. Add one for each zero encountered until a non-zero digit.
 #   4. Add the count to the exp.
 #   5. Check if the exp has crossed zero in #3 above; clear SE.
-- 
2.8.2.534.g1f66975
