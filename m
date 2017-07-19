From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] m68k: Restore symbol versions for symbols exported from
 assembly
Date: Wed, 19 Jul 2017 01:03:25 +0100
Message-ID: <20170719000324.GE18698@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add <asm/asm-prototypes.h> so that genksyms knows the types of
these symbols and can generate CRCs for them.

Fixes: d13ffb563044 ("m68k: move exports to definitions"
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This is build-tested only (m5475evb_defconfig + MODVERSIONS=y).

Ben.

 arch/m68k/include/asm/asm-prototypes.h | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 arch/m68k/include/asm/asm-prototypes.h

diff --git a/arch/m68k/include/asm/asm-prototypes.h b/arch/m68k/include/asm/asm-prototypes.h
new file mode 100644
index 000000000000..4cd692a44c11
--- /dev/null
+++ b/arch/m68k/include/asm/asm-prototypes.h
@@ -0,0 +1,5 @@
+extern void __divsi3(void);
+extern void __modsi3(void);
+extern void __mulsi3(void);
+extern void __udivsi3(void);
+extern void __umodsi3(void);

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWW6hzOe/yOyVhhEJAQq6DhAAqo+GnRt7QZb9/DaIk//askL6odobSAhr
9FxX60rVR6qEkOnjG6kggm9Q1qbCL4g3ZKATkq/jfHJL0QKsl2BeN8UabHypSmTh
5TEuHKZ6P5jOxhxJZtFrouVM/S2tVn9vx1U1I9HmjFhl+G1h8FD/hd8tzWr+rA4a
PnsPxOpirgCE32E4ffarfLiox91ffuoLqJDuT32QqE90YJu61XuZgZgNnQ50g6nw
DZMeqTHcppG/tZtBktTR+LhaT8rRNNIuV8xdxIUy/D7vPAkqx+893AlALAxxVkds
ydx0z5NJH40Rv2IakhZ/iZaEc9lUyhJSJStuY04rSO+JiwQrLxdDrHs0F2D9mTYV
CYClAhGmxOGNFg7PEZwl6yQzsgDTSbq4Hi27JlmUWpffF3619yqLZrjlI5lJ3zxR
wjhOK0Pbx9qxn8HdqNQynUSWV2aKnXEYWU/5Vlb797U0U++0ZoZVdiWjgHQXWrXj
LDNcd5QVPQCo19eRChEFyHlf1SxoIPR3oOov8KqFPtpSGFlIbQfbEPbkNpZwP8oF
ZjFTsDWS06293rdqGUd8YCZacEalAHrHYcxUCBEGvNybpbJLpkugIdPlQS9kOsJP
1WmEE7+Z9FcLLR8Y2MDnJCBtcNXP8b3nteKWcsfZRQEg6sTUOS5FvkgywIuT7+AZ
QnXdh7F/ba4=
=BdAp
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--
