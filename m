From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari - Rename "scc" to "atari_scc"
Date: Sat, 22 Jan 2011 23:25:27 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101222324010.28289@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>

It's a way too generic name for a global #define and conflicts with a v=
ariable
with the same name, causing build errors like:

| drivers/staging/brcm80211/brcmfmac/../util/siutils.c: In function =A1=
_si_clkctl_cc=A2:
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1364: error: exp=
ected identifier or =A1(=A2 before =A1volatile=A2
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1364: error: exp=
ected =A1)=A2 before =A1(=A2 token
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1421: error: inc=
ompatible types in assignment
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1422: error: inv=
alid operands to binary &
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1423: error: inv=
alid operands to binary &
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1424: error: inv=
alid operands to binary |
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: agg=
regate value used where an integer was expected
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1425: error: inc=
ompatible type for argument 4 of =A1bcmsdh_reg_write=A2
| drivers/staging/brcm80211/brcmfmac/../util/siutils.c:1428: error: inv=
alid operands to binary &
| make[8]: *** [drivers/staging/brcm80211/brcmfmac/../util/siutils.o] E=
rror 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This is against the m68k tree. Will split in two parts as atari_scc.c i=
s not
in mainline.

 arch/m68k/atari/ataints.c       |    4 ++--
 arch/m68k/atari/config.c        |    2 +-
 arch/m68k/atari/debug.c         |   14 +++++++-------
 arch/m68k/include/asm/atarihw.h |    2 +-
 drivers/char/atari_scc.c        |   22 +++++++++++-----------
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index eaa23c7..a8eb6ba 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -386,9 +386,9 @@ void __init atari_init_IRQ(void)
 	}
=20
 	if (ATARIHW_PRESENT(SCC) && !atari_SCC_reset_done) {
-		scc.cha_a_ctrl =3D 9;
+		atari_scc.cha_a_ctrl =3D 9;
 		MFPDELAY();
-		scc.cha_a_ctrl =3D (char) 0xc0; /* hardware reset */
+		atari_scc.cha_a_ctrl =3D (char) 0xc0; /* hardware reset */
 	}
=20
 	if (ATARIHW_PRESENT(SCU)) {
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 055a5bc..273c7e8 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -316,7 +316,7 @@ void __init config_atari(void)
 		ATARIHW_SET(SCC_DMA);
 		printk("SCC_DMA ");
 	}
-	if (scc_test(&scc.cha_a_ctrl)) {
+	if (scc_test(&atari_scc.cha_a_ctrl)) {
 		ATARIHW_SET(SCC);
 		printk("SCC ");
 	}
diff --git a/arch/m68k/atari/debug.c b/arch/m68k/atari/debug.c
index 422770f..92d4488 100644
--- a/arch/m68k/atari/debug.c
+++ b/arch/m68k/atari/debug.c
@@ -62,9 +62,9 @@ static inline void ata_scc_out(char c)
 {
 	do {
 		MFPDELAY();
-	} while (!(scc.cha_b_ctrl & 0x04)); /* wait for tx buf empty */
+	} while (!(atari_scc.cha_b_ctrl & 0x04)); /* wait for tx buf empty */
 	MFPDELAY();
-	scc.cha_b_data =3D c;
+	atari_scc.cha_b_data =3D c;
 }
=20
 static void atari_scc_console_write(struct console *co, const char *st=
r,
@@ -149,9 +149,9 @@ int atari_scc_console_wait_key(struct console *co)
 {
 	do {
 		MFPDELAY();
-	} while (!(scc.cha_b_ctrl & 0x01)); /* wait for rx buf filled */
+	} while (!(atari_scc.cha_b_ctrl & 0x01)); /* wait for rx buf filled *=
/
 	MFPDELAY();
-	return scc.cha_b_data;
+	return atari_scc.cha_b_data;
 }
=20
 int atari_midi_console_wait_key(struct console *co)
@@ -194,9 +194,9 @@ static void __init atari_init_mfp_port(int cflag)
=20
 #define SCC_WRITE(reg, val)				\
 	do {						\
-		scc.cha_b_ctrl =3D (reg);			\
+		atari_scc.cha_b_ctrl =3D (reg);		\
 		MFPDELAY();				\
-		scc.cha_b_ctrl =3D (val);			\
+		atari_scc.cha_b_ctrl =3D (val);		\
 		MFPDELAY();				\
 	} while (0)
=20
@@ -248,7 +248,7 @@ static void __init atari_init_scc_port(int cflag)
 	reg3 =3D (cflag & CSIZE) =3D=3D CS8 ? 0xc0 : 0x40;
 	reg5 =3D (cflag & CSIZE) =3D=3D CS8 ? 0x60 : 0x20 | 0x82 /* assert DT=
R/RTS */;
=20
-	(void)scc.cha_b_ctrl;		/* reset reg pointer */
+	(void)atari_scc.cha_b_ctrl;	/* reset reg pointer */
 	SCC_WRITE(9, 0xc0);		/* reset */
 	LONG_DELAY();			/* extra delay after WR9 access */
 	SCC_WRITE(4, (cflag & PARENB) ? ((cflag & PARODD) ? 0x01 : 0x03)
diff --git a/arch/m68k/include/asm/atarihw.h b/arch/m68k/include/asm/at=
arihw.h
index 141e544..9c5ab1c 100644
--- a/arch/m68k/include/asm/atarihw.h
+++ b/arch/m68k/include/asm/atarihw.h
@@ -452,7 +452,7 @@ struct SCC
   u_char char_dummy3;
   u_char cha_b_data;
  };
-# define scc ((*(volatile struct SCC*)SCC_BAS))
+# define atari_scc ((*(volatile struct SCC*)SCC_BAS))
=20
 /* The ESCC (Z85230) in an Atari ST. The channels are reversed! */
 # define st_escc ((*(volatile struct SCC*)0xfffffa31))
diff --git a/drivers/char/atari_scc.c b/drivers/char/atari_scc.c
index 7d7abe5..e442fb4 100644
--- a/drivers/char/atari_scc.c
+++ b/drivers/char/atari_scc.c
@@ -383,7 +383,7 @@ static int atari_tt_scc_init(void)
 	pr_debug("SCC: init channel A\n");
 	port =3D &scc_ports[0];
 	port->channel =3D CHANNEL_A;
-	port->ctrlp =3D (volatile unsigned char *)&scc.cha_a_ctrl;
+	port->ctrlp =3D (volatile unsigned char *)&atari_scc.cha_a_ctrl;
 	port->datap =3D port->ctrlp + 1;
 	port->port_a =3D &scc_ports[0];
 	port->port_b =3D &scc_ports[1];
@@ -422,7 +422,7 @@ static int atari_tt_scc_init(void)
 		pr_debug("SCC: init channel B\n");
 		port =3D &scc_ports[1];
 		port->channel =3D CHANNEL_B;
-		port->ctrlp =3D (volatile unsigned char *)&scc.cha_b_ctrl;
+		port->ctrlp =3D (volatile unsigned char *)&atari_scc.cha_b_ctrl;
 		port->datap =3D port->ctrlp + 1;
 		port->port_a =3D &scc_ports[0];
 		port->port_b =3D &scc_ports[1];
@@ -490,7 +490,7 @@ static int atari_falcon_scc_init(void)
 	/* Init channel A */
 	port =3D &scc_ports[0];
 	port->channel =3D CHANNEL_A;
-	port->ctrlp =3D (volatile unsigned char *)&scc.cha_a_ctrl;
+	port->ctrlp =3D (volatile unsigned char *)&atari_scc.cha_a_ctrl;
 	port->datap =3D port->ctrlp + 2;
 	port->port_a =3D &scc_ports[0];
 	port->port_b =3D &scc_ports[1];
@@ -524,7 +524,7 @@ static int atari_falcon_scc_init(void)
 	/* Init channel B */
 	port =3D &scc_ports[1];
 	port->channel =3D CHANNEL_B;
-	port->ctrlp =3D (volatile unsigned char *)&scc.cha_b_ctrl;
+	port->ctrlp =3D (volatile unsigned char *)&atari_scc.cha_b_ctrl;
 	port->datap =3D port->ctrlp + 2;
 	port->port_a =3D &scc_ports[0];
 	port->port_b =3D &scc_ports[1];
@@ -572,7 +572,7 @@ static int atari_st_scc_init(void)
 	port =3D &scc_ports[1];
 	port->channel =3D CHANNEL_A;
 	port->ctrlp =3D (volatile unsigned char *)(escc ? &st_escc.cha_a_ctrl
-						      : &scc.cha_a_ctrl);
+						      : &atari_scc.cha_a_ctrl);
 	port->datap =3D port->ctrlp + 4;
 	port->port_a =3D &scc_ports[1];
 	port->port_b =3D &scc_ports[0];
@@ -606,7 +606,7 @@ static int atari_st_scc_init(void)
 	port =3D &scc_ports[0];
 	port->channel =3D CHANNEL_B;
 	port->ctrlp =3D (volatile unsigned char *)(escc ? &st_escc.cha_b_ctrl
-						      : &scc.cha_b_ctrl);
+						      : &atari_scc.cha_b_ctrl);
 	port->datap =3D port->ctrlp + 4;
 	port->port_a =3D &scc_ports[0];
 	port->port_b =3D &scc_ports[1];
@@ -1506,9 +1506,9 @@ static int scc_break_ctl(struct tty_struct *tty, =
int break_state)
=20
 #define SCC_WRITE(reg,val)				\
 	do {						\
-		scc.cha_b_ctrl =3D (reg);			\
+		atari_scc.cha_b_ctrl =3D (reg);		\
 		scc_delay();				\
-		scc.cha_b_ctrl =3D (val);			\
+		atari_scc.cha_b_ctrl =3D (val);		\
 		scc_delay();				\
 	} while (0)
=20
@@ -1569,7 +1569,7 @@ static void atari_init_scc_port(int cflag)
 	reg3 =3D (cflag & CSIZE) =3D=3D CS8 ? 0xc0 : 0x40;
 	reg5 =3D (cflag & CSIZE) =3D=3D CS8 ? 0x60 : 0x20 | 0x82 /* assert DT=
R/RTS */;
=20
-	(void)scc.cha_b_ctrl;		/* reset reg pointer */
+	(void)atari_scc.cha_b_ctrl;	/* reset reg pointer */
 	SCC_WRITE(9, 0xc0);		/* reset */
 	LONG_DELAY();			/* extra delay after WR9 access */
 	SCC_WRITE(4, (cflag & PARENB) ? ((cflag & PARODD) ? 0x01 : 0x03) : 0 =
|
@@ -1597,10 +1597,10 @@ static void scc_ch_write(char ch)
 	volatile char *p =3D NULL;
=20
 	if (MACH_IS_TT || MACH_IS_FALCON)
-		p =3D (volatile char *)&scc.cha_b_ctrl;
+		p =3D (volatile char *)&atari_scc.cha_b_ctrl;
=20
 	if (MACH_IS_ST)
-		p =3D (volatile char *)&scc.cha_b_ctrl;
+		p =3D (volatile char *)&atari_scc.cha_b_ctrl;
=20
 	if (MACH_IS_STE)
 		p =3D (volatile char *)&st_escc.cha_b_ctrl;
--=20
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
