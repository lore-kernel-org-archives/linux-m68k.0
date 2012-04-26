From: <gerg@snapgear.com>
Subject: [PATCH v2 01/22] m68knommu: introduce macros to
	simplify ColdFire GPIO table initialization
Date: Thu, 26 Apr 2012 23:14:51 +1000
Message-ID: <1335446091-11177-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

We have very large tables in the ColdFire CPU GPIO setup code that essentially
boil down to 2 distinct types of GPIO pin initiaization. Using 2 macros we can
reduce these large tables to at most a dozen lines of setup code, and in quite
a few cases a single table entry.

Introduce these 2 macros into the existing mcfgpio.h header.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Steven King <sfking@fdwdc.com>
---
 arch/m68k/include/asm/mcfgpio.h |   54 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index ee5e4cc..cd28830 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -37,4 +37,58 @@ void mcf_gpio_set_value_fast(struct gpio_chip *, unsigned, int);
 int mcf_gpio_request(struct gpio_chip *, unsigned);
 void mcf_gpio_free(struct gpio_chip *, unsigned);
 
+/*
+ *	Define macros to ease the pain of setting up the GPIO tables. There
+ *	is two cases we need to deal with here, they cover all currently
+ *	available ColdFire GPIO hardware. There is of course minor differences
+ *	in the layout and number of bits in each ColdFire part, but the macros
+ *	take all that in.
+ *
+ *	Firstly is the conventional GPIO registers where we toggle individual
+ *	bits in a register, preserving the other bits in the register. For
+ *	lack of a better term I have called this the slow method.
+ */
+#define	MCFGPS(mlabel, mbase, mngpio, mpddr, mpodr, mppdr)		    \
+	{								    \
+		.gpio_chip			= {			    \
+			.label			= #mlabel,		    \
+			.request		= mcf_gpio_request,	    \
+			.free			= mcf_gpio_free,	    \
+			.direction_input	= mcf_gpio_direction_input, \
+			.direction_output	= mcf_gpio_direction_output,\
+			.get			= mcf_gpio_get_value,	    \
+			.set			= mcf_gpio_set_value,       \
+			.base			= mbase,		    \
+			.ngpio			= mngpio,		    \
+		},							    \
+		.pddr		= (void __iomem *) mpddr,		    \
+		.podr		= (void __iomem *) mpodr,		    \
+		.ppdr		= (void __iomem *) mppdr,		    \
+	}
+
+/*
+ *	Secondly is the faster case, where we have set and clear registers
+ *	that allow us to set or clear a bit with a single write, not having
+ *	to worry about preserving other bits.
+ */
+#define	MCFGPF(mlabel, mbase, mngpio)					    \
+	{								    \
+		.gpio_chip			= {			    \
+			.label			= #mlabel,		    \
+			.request		= mcf_gpio_request,	    \
+			.free			= mcf_gpio_free,	    \
+			.direction_input	= mcf_gpio_direction_input, \
+			.direction_output	= mcf_gpio_direction_output,\
+			.get			= mcf_gpio_get_value,	    \
+			.set			= mcf_gpio_set_value_fast,  \
+			.base			= mbase,		    \
+			.ngpio			= mngpio,		    \
+		},							    \
+		.pddr		= (void __iomem *) MCFGPIO_PDDR_##mlabel,   \
+		.podr		= (void __iomem *) MCFGPIO_PODR_##mlabel,   \
+		.ppdr		= (void __iomem *) MCFGPIO_PPDSDR_##mlabel, \
+		.setr		= (void __iomem *) MCFGPIO_PPDSDR_##mlabel, \
+		.clrr		= (void __iomem *) MCFGPIO_PCLRR_##mlabel,  \
+	}
+
 #endif
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
