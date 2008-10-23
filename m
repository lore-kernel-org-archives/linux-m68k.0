From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Thu, 23 Oct 2008 09:39:41 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810230937200.7533@anakin>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
 <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
 <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
 <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
 <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810230910460.7533@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:38944 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbYJWHjp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Oct 2008 03:39:45 -0400
In-Reply-To: <Pine.LNX.4.64.0810230910460.7533@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Roman Zippel <zippel@linux-m68k.org>
Cc: Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 23 Oct 2008, Geert Uytterhoeven wrote:
> On Thu, 23 Oct 2008, Michael Schmitz wrote:
> It seems to be removed in early 2.5 (2.4 has it, my oldest 2.5 is 2.5.5
> and that one doesn't have it anymore):

> and `mach_gettod' was wired up to 'mac_gettod'.
> 
> No idea why it was removed. I should check my mail archives (2002 and
> older are on CD).

full-history-linux.git points to:

commit d5d48bb9b0d46f7eb6168a2e573fcf78d00c7244
Author: Roman Zippel <zippel@linux-m68k.org>
Date:   Mon May 6 20:10:29 2002 -0700

    [PATCH] m68k: remove hwclk_time/gettod [9/20]
    
    - replace hwclk_time with rtc_time
    - use hwclk instead of gettod to set initial time

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 4c8bb27..ab3d3e1 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 #include <linux/tty.h>
 #include <linux/console.h>
+#include <linux/rtc.h>
 #include <linux/init.h>
 #ifdef CONFIG_ZORRO
 #include <linux/zorro.h>
@@ -89,9 +90,8 @@ static int amiga_get_hardware_list(char *buffer);
 extern int show_amiga_interrupts (struct seq_file *, void *);
 /* amiga specific timer functions */
 static unsigned long amiga_gettimeoffset (void);
-static void a3000_gettod (int *, int *, int *, int *, int *, int *);
-static void a2000_gettod (int *, int *, int *, int *, int *, int *);
-static int amiga_hwclk (int, struct hwclk_time *);
+static int a3000_hwclk (int, struct rtc_time *);
+static int a2000_hwclk (int, struct rtc_time *);
 static int amiga_set_clock_mmss (unsigned long);
 extern void amiga_mksound( unsigned int count, unsigned int ticks );
 #ifdef CONFIG_AMIGA_FLOPPY
@@ -404,12 +404,12 @@ void __init config_amiga(void)
   mach_get_irq_list    = show_amiga_interrupts;
   mach_gettimeoffset   = amiga_gettimeoffset;
   if (AMIGAHW_PRESENT(A3000_CLK)){
-    mach_gettod  = a3000_gettod;
+    mach_hwclk         = a3000_hwclk;
     rtc_resource.name = "A3000 RTC";
     request_resource(&iomem_resource, &rtc_resource);
   }
   else{ /* if (AMIGAHW_PRESENT(A2000_CLK)) */
-    mach_gettod  = a2000_gettod;
+    mach_hwclk         = a2000_hwclk;
     rtc_resource.name = "A2000 RTC";
     request_resource(&iomem_resource, &rtc_resource);
   }
@@ -424,7 +424,6 @@ void __init config_amiga(void)
 				      * system.                  /Jes
 				      */
 
-  mach_hwclk           = amiga_hwclk;
   mach_set_clock_mmss  = amiga_set_clock_mmss;
 #ifdef CONFIG_AMIGA_FLOPPY
   mach_floppy_setup    = amiga_floppy_setup;
@@ -569,25 +568,47 @@ static unsigned long amiga_gettimeoffset (void)
 	return ticks + offset;
 }
 
-static void a3000_gettod (int *yearp, int *monp, int *dayp,
-			  int *hourp, int *minp, int *secp)
+static int a3000_hwclk(int op, struct rtc_time *t)
 {
 	volatile struct tod3000 *tod = TOD_3000;
 
 	tod->cntrl1 = TOD3000_CNTRL1_HOLD;
 
-	*secp  = tod->second1 * 10 + tod->second2;
-	*minp  = tod->minute1 * 10 + tod->minute2;
-	*hourp = tod->hour1   * 10 + tod->hour2;
-	*dayp  = tod->day1    * 10 + tod->day2;
-	*monp  = tod->month1  * 10 + tod->month2;
-	*yearp = tod->year1   * 10 + tod->year2;
+	if (!op) { /* read */
+		t->tm_sec  = tod->second1 * 10 + tod->second2;
+		t->tm_min  = tod->minute1 * 10 + tod->minute2;
+		t->tm_hour = tod->hour1   * 10 + tod->hour2;
+		t->tm_mday = tod->day1    * 10 + tod->day2;
+		t->tm_wday = tod->weekday;
+		t->tm_mon  = tod->month1  * 10 + tod->month2 - 1;
+		t->tm_year = tod->year1   * 10 + tod->year2;
+		if (t->tm_year <= 69)
+			t->tm_year += 100;
+	} else {
+		tod->second1 = t->tm_sec / 10;
+		tod->second2 = t->tm_sec % 10;
+		tod->minute1 = t->tm_min / 10;
+		tod->minute2 = t->tm_min % 10;
+		tod->hour1   = t->tm_hour / 10;
+		tod->hour2   = t->tm_hour % 10;
+		tod->day1    = t->tm_mday / 10;
+		tod->day2    = t->tm_mday % 10;
+		if (t->tm_wday != -1)
+			tod->weekday = t->tm_wday;
+		tod->month1  = (t->tm_mon + 1) / 10;
+		tod->month2  = (t->tm_mon + 1) % 10;
+		if (t->tm_year >= 100)
+			t->tm_year -= 100;
+		tod->year1   = t->tm_year / 10;
+		tod->year2   = t->tm_year % 10;
+	}
 
 	tod->cntrl1 = TOD3000_CNTRL1_FREE;
+
+	return 0;
 }
 
-static void a2000_gettod (int *yearp, int *monp, int *dayp,
-			  int *hourp, int *minp, int *secp)
+static int a2000_hwclk(int op, struct rtc_time *t)
 {
 	volatile struct tod2000 *tod = TOD_2000;
 
@@ -596,112 +617,49 @@ static void a2000_gettod (int *yearp, int *monp, int *dayp,
 	while (tod->cntrl1 & TOD2000_CNTRL1_BUSY)
 		;
 
-	*secp  = tod->second1     * 10 + tod->second2;
-	*minp  = tod->minute1     * 10 + tod->minute2;
-	*hourp = (tod->hour1 & 3) * 10 + tod->hour2;
-	*dayp  = tod->day1        * 10 + tod->day2;
-	*monp  = tod->month1      * 10 + tod->month2;
-	*yearp = tod->year1       * 10 + tod->year2;
-
-	if (!(tod->cntrl3 & TOD2000_CNTRL3_24HMODE)){
-		if (!(tod->hour1 & TOD2000_HOUR1_PM) && *hourp == 12)
-			*hourp = 0;
-		else if ((tod->hour1 & TOD2000_HOUR1_PM) && *hourp != 12)
-			*hourp += 12;
+	if (!op) { /* read */
+		t->tm_sec  = tod->second1     * 10 + tod->second2;
+		t->tm_min  = tod->minute1     * 10 + tod->minute2;
+		t->tm_hour = (tod->hour1 & 3) * 10 + tod->hour2;
+		t->tm_mday = tod->day1        * 10 + tod->day2;
+		t->tm_wday = tod->weekday;
+		t->tm_mon  = tod->month1      * 10 + tod->month2 - 1;
+		t->tm_year = tod->year1       * 10 + tod->year2;
+		if (t->tm_year <= 69)
+			t->tm_year += 100;
+
+		if (!(tod->cntrl3 & TOD2000_CNTRL3_24HMODE)){
+			if (!(tod->hour1 & TOD2000_HOUR1_PM) && t->tm_hour == 12)
+				t->tm_hour = 0;
+			else if ((tod->hour1 & TOD2000_HOUR1_PM) && t->tm_hour != 12)
+				t->tm_hour += 12;
+		}
+	} else {
+		tod->second1 = t->tm_sec / 10;
+		tod->second2 = t->tm_sec % 10;
+		tod->minute1 = t->tm_min / 10;
+		tod->minute2 = t->tm_min % 10;
+		if (tod->cntrl3 & TOD2000_CNTRL3_24HMODE)
+			tod->hour1 = t->tm_hour / 10;
+		else if (t->tm_hour >= 12)
+			tod->hour1 = TOD2000_HOUR1_PM +
+				(t->tm_hour - 12) / 10;
+		else
+			tod->hour1 = t->tm_hour / 10;
+		tod->hour2   = t->tm_hour % 10;
+		tod->day1    = t->tm_mday / 10;
+		tod->day2    = t->tm_mday % 10;
+		if (t->tm_wday != -1)
+			tod->weekday = t->tm_wday;
+		tod->month1  = (t->tm_mon + 1) / 10;
+		tod->month2  = (t->tm_mon + 1) % 10;
+		if (t->tm_year >= 100)
+			t->tm_year -= 100;
+		tod->year1   = t->tm_year / 10;
+		tod->year2   = t->tm_year % 10;
 	}
 
 	tod->cntrl1 &= ~TOD2000_CNTRL1_HOLD;
-}
-
-static int amiga_hwclk(int op, struct hwclk_time *t)
-{
-	if (AMIGAHW_PRESENT(A3000_CLK)) {
-		volatile struct tod3000 *tod = TOD_3000;
-
-		tod->cntrl1 = TOD3000_CNTRL1_HOLD;
-
-		if (!op) { /* read */
-			t->sec  = tod->second1 * 10 + tod->second2;
-			t->min  = tod->minute1 * 10 + tod->minute2;
-			t->hour = tod->hour1   * 10 + tod->hour2;
-			t->day  = tod->day1    * 10 + tod->day2;
-			t->wday = tod->weekday;
-			t->mon  = tod->month1  * 10 + tod->month2 - 1;
-			t->year = tod->year1   * 10 + tod->year2;
-			if (t->year <= 69)
-				t->year += 100;
-		} else {
-			tod->second1 = t->sec / 10;
-			tod->second2 = t->sec % 10;
-			tod->minute1 = t->min / 10;
-			tod->minute2 = t->min % 10;
-			tod->hour1   = t->hour / 10;
-			tod->hour2   = t->hour % 10;
-			tod->day1    = t->day / 10;
-			tod->day2    = t->day % 10;
-			if (t->wday != -1)
-				tod->weekday = t->wday;
-			tod->month1  = (t->mon + 1) / 10;
-			tod->month2  = (t->mon + 1) % 10;
-			if (t->year >= 100)
-				t->year -= 100;
-			tod->year1   = t->year / 10;
-			tod->year2   = t->year % 10;
-		}
-
-		tod->cntrl1 = TOD3000_CNTRL1_FREE;
-	} else /* if (AMIGAHW_PRESENT(A2000_CLK)) */ {
-		volatile struct tod2000 *tod = TOD_2000;
-
-		tod->cntrl1 = TOD2000_CNTRL1_HOLD;
-	    
-		while (tod->cntrl1 & TOD2000_CNTRL1_BUSY)
-			;
-
-		if (!op) { /* read */
-			t->sec  = tod->second1     * 10 + tod->second2;
-			t->min  = tod->minute1     * 10 + tod->minute2;
-			t->hour = (tod->hour1 & 3) * 10 + tod->hour2;
-			t->day  = tod->day1        * 10 + tod->day2;
-			t->wday = tod->weekday;
-			t->mon  = tod->month1      * 10 + tod->month2 - 1;
-			t->year = tod->year1       * 10 + tod->year2;
-			if (t->year <= 69)
-				t->year += 100;
-
-			if (!(tod->cntrl3 & TOD2000_CNTRL3_24HMODE)){
-				if (!(tod->hour1 & TOD2000_HOUR1_PM) && t->hour == 12)
-					t->hour = 0;
-				else if ((tod->hour1 & TOD2000_HOUR1_PM) && t->hour != 12)
-					t->hour += 12;
-			}
-		} else {
-			tod->second1 = t->sec / 10;
-			tod->second2 = t->sec % 10;
-			tod->minute1 = t->min / 10;
-			tod->minute2 = t->min % 10;
-			if (tod->cntrl3 & TOD2000_CNTRL3_24HMODE)
-				tod->hour1 = t->hour / 10;
-			else if (t->hour >= 12)
-				tod->hour1 = TOD2000_HOUR1_PM +
-					(t->hour - 12) / 10;
-			else
-				tod->hour1 = t->hour / 10;
-			tod->hour2   = t->hour % 10;
-			tod->day1    = t->day / 10;
-			tod->day2    = t->day % 10;
-			if (t->wday != -1)
-				tod->weekday = t->wday;
-			tod->month1  = (t->mon + 1) / 10;
-			tod->month2  = (t->mon + 1) % 10;
-			if (t->year >= 100)
-				t->year -= 100;
-			tod->year1   = t->year / 10;
-			tod->year2   = t->year % 10;
-		}
-
-		tod->cntrl1 &= ~TOD2000_CNTRL1_HOLD;
-	}
 
 	return 0;
 }
diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index 189bea1..a8ef5af 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -4,6 +4,7 @@
 #include <linux/mm.h>
 #include <linux/tty.h>
 #include <linux/console.h>
+#include <linux/rtc.h>
 
 #include <asm/setup.h>
 #include <asm/bootinfo.h>
@@ -33,8 +34,7 @@ extern void dn_enable_irq(unsigned int);
 extern void dn_disable_irq(unsigned int);
 extern int show_dn_interrupts(struct seq_file *, void *);
 extern unsigned long dn_gettimeoffset(void);
-extern void dn_gettod(int *, int *, int *, int *, int *, int *);
-extern int dn_dummy_hwclk(int, struct hwclk_time *);
+extern int dn_dummy_hwclk(int, struct rtc_time *);
 extern int dn_dummy_set_clock_mmss(unsigned long);
 extern void dn_mksound(unsigned int count, unsigned int ticks);
 extern void dn_dummy_reset(void);
@@ -175,7 +175,6 @@ void config_apollo(void) {
 	disable_irq     = dn_disable_irq;
 	mach_get_irq_list    = show_dn_interrupts;
 	mach_gettimeoffset   = dn_gettimeoffset;
-	mach_gettod	     = dn_gettod; /* */
 	mach_max_dma_address = 0xffffffff;
 	mach_hwclk           = dn_dummy_hwclk; /* */
 	mach_set_clock_mmss  = dn_dummy_set_clock_mmss; /* */
@@ -240,40 +239,26 @@ unsigned long dn_gettimeoffset(void) {
 
 }
 
-void dn_gettod(int *yearp, int *monp, int *dayp,
-	       int *hourp, int *minp, int *secp) {
-
-  *yearp=rtc->year;
-  *monp=rtc->month;
-  *dayp=rtc->day_of_month;
-  *hourp=rtc->hours;
-  *minp=rtc->minute;
-  *secp=rtc->second;
-
-printk("gettod: %d %d %d %d %d %d\n",*yearp,*monp,*dayp,*hourp,*minp,*secp);
-
-}
-
-int dn_dummy_hwclk(int op, struct hwclk_time *t) {
+int dn_dummy_hwclk(int op, struct rtc_time *t) {
 
 
   if(!op) { /* read */
-    t->sec=rtc->second;
-    t->min=rtc->minute;
-    t->hour=rtc->hours;
-    t->day=rtc->day_of_month;
-    t->wday=rtc->day_of_week;
-    t->mon=rtc->month;
-    t->year=rtc->year;
+    t->tm_sec=rtc->second;
+    t->tm_min=rtc->minute;
+    t->tm_hour=rtc->hours;
+    t->tm_mday=rtc->day_of_month;
+    t->tm_wday=rtc->day_of_week;
+    t->tm_mon=rtc->month;
+    t->tm_year=rtc->year;
   } else {
-    rtc->second=t->sec;
-    rtc->minute=t->min;
-    rtc->hours=t->hour;
-    rtc->day_of_month=t->day;
-    if(t->wday!=-1)
-      rtc->day_of_week=t->wday;
-    rtc->month=t->mon;
-    rtc->year=t->year;
+    rtc->second=t->tm_sec;
+    rtc->minute=t->tm_min;
+    rtc->hours=t->tm_hour;
+    rtc->day_of_month=t->tm_mday;
+    if(t->tm_wday!=-1)
+      rtc->day_of_week=t->tm_wday;
+    rtc->month=t->tm_mon;
+    rtc->year=t->tm_year;
   }
 
   return 0;
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 6988035..1b69fa9 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -38,6 +38,7 @@
 #include <asm/atariints.h>
 #include <asm/atari_stram.h>
 #include <asm/system.h>
+#include <asm/keyboard.h>
 #include <asm/machdep.h>
 #include <asm/hwtest.h>
 #include <asm/io.h>
@@ -79,10 +80,8 @@ static void atari_heartbeat( int on );
 /* atari specific timer functions (in time.c) */
 extern void atari_sched_init(void (*)(int, void *, struct pt_regs *));
 extern unsigned long atari_gettimeoffset (void);
-extern void atari_mste_gettod (int *, int *, int *, int *, int *, int *);
-extern void atari_tt_gettod (int *, int *, int *, int *, int *, int *);
-extern int atari_mste_hwclk (int, struct hwclk_time *);
-extern int atari_tt_hwclk (int, struct hwclk_time *);
+extern int atari_mste_hwclk (int, struct rtc_time *);
+extern int atari_tt_hwclk (int, struct rtc_time *);
 extern int atari_mste_set_clock_mmss (unsigned long);
 extern int atari_tt_set_clock_mmss (unsigned long);
 
@@ -444,14 +443,12 @@ void __init config_atari(void)
     if (hwreg_present( &tt_rtc.regsel )) {
 	ATARIHW_SET(TT_CLK);
         printk( "TT_CLK " );
-        mach_gettod = atari_tt_gettod;
         mach_hwclk = atari_tt_hwclk;
         mach_set_clock_mmss = atari_tt_set_clock_mmss;
     }
     if (!MACH_IS_HADES && hwreg_present( &mste_rtc.sec_ones)) {
 	ATARIHW_SET(MSTE_CLK);
         printk( "MSTE_CLK ");
-        mach_gettod = atari_mste_gettod;
         mach_hwclk = atari_mste_hwclk;
         mach_set_clock_mmss = atari_mste_set_clock_mmss;
     }
diff --git a/arch/m68k/atari/time.c b/arch/m68k/atari/time.c
index 0d92a3b..b57a805 100644
--- a/arch/m68k/atari/time.c
+++ b/arch/m68k/atari/time.c
@@ -14,6 +14,7 @@
 #include <linux/mc146818rtc.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/rtc.h>
 
 #include <asm/rtc.h>
 
@@ -83,88 +84,21 @@ static void mste_write(struct MSTE_RTC *val)
 
 #define	RTC_READ(reg)				\
     ({	unsigned char	__val;			\
-		(void) writeb(reg,&tt_rtc.regsel);	\
+		(void) atari_writeb(reg,&tt_rtc.regsel);	\
 		__val = tt_rtc.data;		\
 		__val;				\
 	})
 
 #define	RTC_WRITE(reg,val)			\
     do {					\
-		writeb(reg,&tt_rtc.regsel);	\
+		atari_writeb(reg,&tt_rtc.regsel);	\
 		tt_rtc.data = (val);		\
 	} while(0)
 
 
-void atari_mste_gettod (int *yearp, int *monp, int *dayp,
-			int *hourp, int *minp, int *secp)
-{
-    int hr24=0, hour;
-    struct MSTE_RTC val;
-
-    mste_rtc.mode=(mste_rtc.mode | 1);
-    hr24=mste_rtc.mon_tens & 1;
-    mste_rtc.mode=(mste_rtc.mode & ~1);
-
-    mste_read(&val);
-    *secp = val.sec_ones + val.sec_tens * 10;
-    *minp = val.min_ones + val.min_tens * 10;
-    hour = val.hr_ones + val.hr_tens * 10;
-    if (!hr24) {
-        if (hour == 12 || hour == 12 + 20)
-	    hour -= 12;
-	if (hour >= 20)
-	    hour += 12 - 20;
-    }
-    *hourp = hour;
-    *dayp = val.day_ones + val.day_tens * 10;
-    *monp = val.mon_ones + val.mon_tens * 10;
-    *yearp = val.year_ones + val.year_tens * 10 + 80;	
-}
-
-  
-void atari_tt_gettod (int *yearp, int *monp, int *dayp,
-		      int *hourp, int *minp, int *secp)
-{
-    unsigned char	ctrl;
-    int hour, pm;
-
-    while (!(RTC_READ(RTC_FREQ_SELECT) & RTC_UIP)) ;
-    while (RTC_READ(RTC_FREQ_SELECT) & RTC_UIP) ;
-
-    *secp  = RTC_READ(RTC_SECONDS);
-    *minp  = RTC_READ(RTC_MINUTES);
-    hour = RTC_READ(RTC_HOURS);
-    *dayp  = RTC_READ(RTC_DAY_OF_MONTH);
-    *monp  = RTC_READ(RTC_MONTH);
-    *yearp = RTC_READ(RTC_YEAR);
-    pm = hour & 0x80;
-    hour &= ~0x80;
-
-    ctrl = RTC_READ(RTC_CONTROL); 
-
-    if (!(ctrl & RTC_DM_BINARY)) {
-        BCD_TO_BIN(*secp);
-        BCD_TO_BIN(*minp);
-        BCD_TO_BIN(hour);
-        BCD_TO_BIN(*dayp);
-        BCD_TO_BIN(*monp);
-        BCD_TO_BIN(*yearp);
-    }
-    if (!(ctrl & RTC_24H)) {
-	if (!pm && hour == 12)
-	    hour = 0;
-	else if (pm && hour != 12)
-            hour += 12;
-    }
-    *hourp = hour;
-
-    /* Adjust values (let the setup valid) */
-    *yearp += atari_rtc_year_offset;
-}
-
 #define HWCLK_POLL_INTERVAL	5
 
-int atari_mste_hwclk( int op, struct hwclk_time *t )
+int atari_mste_hwclk( int op, struct rtc_time *t )
 {
     int hour, year;
     int hr24=0;
@@ -177,11 +111,11 @@ int atari_mste_hwclk( int op, struct hwclk_time *t )
     if (op) {
         /* write: prepare values */
         
-        val.sec_ones = t->sec % 10;
-        val.sec_tens = t->sec / 10;
-        val.min_ones = t->min % 10;
-        val.min_tens = t->min / 10;
-        hour = t->hour;
+        val.sec_ones = t->tm_sec % 10;
+        val.sec_tens = t->tm_sec / 10;
+        val.min_ones = t->tm_min % 10;
+        val.min_tens = t->tm_min / 10;
+        hour = t->tm_hour;
         if (!hr24) {
 	    if (hour > 11)
 		hour += 20 - 12;
@@ -190,14 +124,14 @@ int atari_mste_hwclk( int op, struct hwclk_time *t )
         }
         val.hr_ones = hour % 10;
         val.hr_tens = hour / 10;
-        val.day_ones = t->day % 10;
-        val.day_tens = t->day / 10;
-        val.mon_ones = (t->mon+1) % 10;
-        val.mon_tens = (t->mon+1) / 10;
-        year = t->year - 80;
+        val.day_ones = t->tm_mday % 10;
+        val.day_tens = t->tm_mday / 10;
+        val.mon_ones = (t->tm_mon+1) % 10;
+        val.mon_tens = (t->tm_mon+1) / 10;
+        year = t->tm_year - 80;
         val.year_ones = year % 10;
         val.year_tens = year / 10;
-        val.weekday = t->wday;
+        val.weekday = t->tm_wday;
         mste_write(&val);
         mste_rtc.mode=(mste_rtc.mode | 1);
         val.year_ones = (year % 4);	/* leap year register */
@@ -205,8 +139,8 @@ int atari_mste_hwclk( int op, struct hwclk_time *t )
     }
     else {
         mste_read(&val);
-        t->sec = val.sec_ones + val.sec_tens * 10;
-        t->min = val.min_ones + val.min_tens * 10;
+        t->tm_sec = val.sec_ones + val.sec_tens * 10;
+        t->tm_min = val.min_ones + val.min_tens * 10;
         hour = val.hr_ones + val.hr_tens * 10;
 	if (!hr24) {
 	    if (hour == 12 || hour == 12 + 20)
@@ -214,16 +148,16 @@ int atari_mste_hwclk( int op, struct hwclk_time *t )
 	    if (hour >= 20)
                 hour += 12 - 20;
         }
-	t->hour = hour;
-	t->day = val.day_ones + val.day_tens * 10;
-        t->mon = val.mon_ones + val.mon_tens * 10 - 1;
-        t->year = val.year_ones + val.year_tens * 10 + 80;
-        t->wday = val.weekday;
+	t->tm_hour = hour;
+	t->tm_mday = val.day_ones + val.day_tens * 10;
+        t->tm_mon  = val.mon_ones + val.mon_tens * 10 - 1;
+        t->tm_year = val.year_ones + val.year_tens * 10 + 80;
+        t->tm_wday = val.weekday;
     }
     return 0;
 }
 
-int atari_tt_hwclk( int op, struct hwclk_time *t )
+int atari_tt_hwclk( int op, struct rtc_time *t )
 {
     int sec=0, min=0, hour=0, day=0, mon=0, year=0, wday=0; 
     unsigned long 	flags;
@@ -236,13 +170,13 @@ int atari_tt_hwclk( int op, struct hwclk_time *t )
     if (op) {
         /* write: prepare values */
         
-        sec  = t->sec;
-        min  = t->min;
-        hour = t->hour;
-        day  = t->day;
-        mon  = t->mon + 1;
-        year = t->year - atari_rtc_year_offset;
-        wday = t->wday + (t->wday >= 0);
+        sec  = t->tm_sec;
+        min  = t->tm_min;
+        hour = t->tm_hour;
+        day  = t->tm_mday;
+        mon  = t->tm_mon + 1;
+        year = t->tm_year - atari_rtc_year_offset;
+        wday = t->tm_wday + (t->tm_wday >= 0);
         
         if (!(ctrl & RTC_24H)) {
 	    if (hour > 11) {
@@ -331,13 +265,13 @@ int atari_tt_hwclk( int op, struct hwclk_time *t )
 		hour += 12;
         }
 
-        t->sec  = sec;
-        t->min  = min;
-        t->hour = hour;
-        t->day  = day;
-        t->mon  = mon - 1;
-        t->year = year + atari_rtc_year_offset;
-        t->wday = wday - 1;
+        t->tm_sec  = sec;
+        t->tm_min  = min;
+        t->tm_hour = hour;
+        t->tm_mday = day;
+        t->tm_mon  = mon - 1;
+        t->tm_year = year + atari_rtc_year_offset;
+        t->tm_wday = wday - 1;
     }
 
     return( 0 );
diff --git a/arch/m68k/bvme6000/config.c b/arch/m68k/bvme6000/config.c
index 002c9a6..2a15d06 100644
--- a/arch/m68k/bvme6000/config.c
+++ b/arch/m68k/bvme6000/config.c
@@ -22,6 +22,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/major.h>
+#include <linux/rtc.h>
 
 #include <asm/bootinfo.h>
 #include <asm/system.h>
@@ -46,9 +47,7 @@ extern void bvme6000_sched_init(void (*handler)(int, void *, struct pt_regs *));
 extern int  bvme6000_keyb_init(void);
 extern int  bvme6000_kbdrate (struct kbd_repeat *);
 extern unsigned long bvme6000_gettimeoffset (void);
-extern void bvme6000_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec);
-extern int bvme6000_hwclk (int, struct hwclk_time *);
+extern int bvme6000_hwclk (int, struct rtc_time *);
 extern int bvme6000_set_clock_mmss (unsigned long);
 extern void bvme6000_check_partition (struct gendisk *hd, unsigned int dev);
 extern void bvme6000_mksound( unsigned int count, unsigned int ticks );
@@ -138,7 +137,6 @@ void __init config_bvme6000(void)
     mach_kbdrate         = bvme6000_kbdrate;
     mach_init_IRQ        = bvme6000_init_IRQ;
     mach_gettimeoffset   = bvme6000_gettimeoffset;
-    mach_gettod  	 = bvme6000_gettod;
     mach_hwclk           = bvme6000_hwclk;
     mach_set_clock_mmss	 = bvme6000_set_clock_mmss;
 /*  mach_mksound         = bvme6000_mksound; */
@@ -181,8 +179,8 @@ void bvme6000_abort_int (int irq, void *dev_id, struct pt_regs *fp)
         unsigned long *old = (unsigned long *)0xf8000000;
 
         /* Wait for button release */
-	while (*config_reg_ptr & BVME_ABORT_STATUS)
-		;
+        while (*(volatile unsigned char *)BVME_LOCAL_IRQ_STAT & BVME_ABORT_STATUS)
+                ;
 
         *(new+4) = *(old+4);            /* Illegal instruction */
         *(new+9) = *(old+9);            /* Trace */
@@ -284,26 +282,6 @@ unsigned long bvme6000_gettimeoffset (void)
     return v;
 }
 
-extern void bvme6000_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec)
-{
-	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
-	unsigned char msr = rtc->msr & 0xc0;
-
-	rtc->msr = 0;		/* Ensure clock accessible */
-
-	do {	/* Loop until we get a reading with a stable seconds field */
-		*sec = bcd2bin (rtc->bcd_sec);
-		*min = bcd2bin (rtc->bcd_min);
-		*hour = bcd2bin (rtc->bcd_hr);
-		*day = bcd2bin (rtc->bcd_dom);
-		*mon = bcd2bin (rtc->bcd_mth);
-		*year = bcd2bin (rtc->bcd_year);
-	} while (bcd2bin (rtc->bcd_sec) != *sec);
-
-	rtc->msr = msr;
-}
-
 static unsigned char bcd2bin (unsigned char b)
 {
 	return ((b>>4)*10 + (b&15));
@@ -330,7 +308,7 @@ static unsigned char bin2bcd (unsigned char b)
  * };
  */
 
-int bvme6000_hwclk(int op, struct hwclk_time *t)
+int bvme6000_hwclk(int op, struct rtc_time *t)
 {
 	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
 	unsigned char msr = rtc->msr & 0xc0;
@@ -339,31 +317,31 @@ int bvme6000_hwclk(int op, struct hwclk_time *t)
 				 * are accessible */
 	if (op)
 	{	/* Write.... */
-		rtc->t0cr_rtmr = t->year%4;
+		rtc->t0cr_rtmr = t->tm_year%4;
 		rtc->bcd_tenms = 0;
-		rtc->bcd_sec = bin2bcd(t->sec);
-		rtc->bcd_min = bin2bcd(t->min);
-		rtc->bcd_hr  = bin2bcd(t->hour);
-		rtc->bcd_dom = bin2bcd(t->day);
-		rtc->bcd_mth = bin2bcd(t->mon + 1);
-		rtc->bcd_year = bin2bcd(t->year%100);
-		if (t->wday >= 0)
-			rtc->bcd_dow = bin2bcd(t->wday+1);
-		rtc->t0cr_rtmr = t->year%4 | 0x08;
+		rtc->bcd_sec = bin2bcd(t->tm_sec);
+		rtc->bcd_min = bin2bcd(t->tm_min);
+		rtc->bcd_hr  = bin2bcd(t->tm_hour);
+		rtc->bcd_dom = bin2bcd(t->tm_mday);
+		rtc->bcd_mth = bin2bcd(t->tm_mon + 1);
+		rtc->bcd_year = bin2bcd(t->tm_year%100);
+		if (t->tm_wday >= 0)
+			rtc->bcd_dow = bin2bcd(t->tm_wday+1);
+		rtc->t0cr_rtmr = t->tm_year%4 | 0x08;
 	}
 	else
 	{	/* Read....  */
 		do {
-			t->sec =  bcd2bin(rtc->bcd_sec);
-			t->min =  bcd2bin(rtc->bcd_min);
-			t->hour = bcd2bin(rtc->bcd_hr);
-			t->day =  bcd2bin(rtc->bcd_dom);
-			t->mon =  bcd2bin(rtc->bcd_mth)-1;
-			t->year = bcd2bin(rtc->bcd_year);
-			if (t->year < 70)
-				t->year += 100;
-			t->wday = bcd2bin(rtc->bcd_dow)-1;
-		} while (t->sec != bcd2bin(rtc->bcd_sec));
+			t->tm_sec  = bcd2bin(rtc->bcd_sec);
+			t->tm_min  = bcd2bin(rtc->bcd_min);
+			t->tm_hour = bcd2bin(rtc->bcd_hr);
+			t->tm_mday = bcd2bin(rtc->bcd_dom);
+			t->tm_mon  = bcd2bin(rtc->bcd_mth)-1;
+			t->tm_year = bcd2bin(rtc->bcd_year);
+			if (t->tm_year < 70)
+				t->tm_year += 100;
+			t->tm_wday = bcd2bin(rtc->bcd_dow)-1;
+		} while (t->tm_sec != bcd2bin(rtc->bcd_sec));
 	}
 
 	rtc->msr = msr;
@@ -419,55 +397,3 @@ int bvme6000_keyb_init (void)
 {
 	return 0;
 }
-
-/*-------------------  Serial console stuff ------------------------*/
-
-static void bvme_scc_write(struct console *co, const char *str, unsigned cnt);
-
-
-void bvme6000_init_console_port (struct console *co, int cflag)
-{
-        co->write = bvme_scc_write;
-}
-
-
-static void scc_delay (void)
-{
-        int n;
-	volatile int trash;
-
-        for (n = 0; n < 20; n++)
-		trash = n;
-}
-
-static void scc_write (char ch)
-{
-        volatile char *p = (volatile char *)BVME_SCC_A_ADDR;
-
-        do {
-                scc_delay();
-        }
-        while (!(*p & 4));
-        scc_delay();
-        *p = 8;
-        scc_delay();
-        *p = ch;
-}
-
-
-static void bvme_scc_write (struct console *co, const char *str, unsigned count)
-{
-        unsigned long   flags;
-
-        save_flags(flags);
-        cli();
-
-        while (count--)
-        {
-                if (*str == '\n')
-                        scc_write ('\r');
-                scc_write (*str++);
-        }
-        restore_flags(flags);
-}
-
diff --git a/arch/m68k/bvme6000/rtc.c b/arch/m68k/bvme6000/rtc.c
index 8038337..47d77f2 100644
--- a/arch/m68k/bvme6000/rtc.c
+++ b/arch/m68k/bvme6000/rtc.c
@@ -94,7 +94,7 @@ static int rtc_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
 
 		leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
 
-		if ((mon > 12) || (day == 0))
+		if ((mon > 12) || (mon < 1) || (day == 0))
 			return -EINVAL;
 
 		if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
diff --git a/arch/m68k/hp300/config.c b/arch/m68k/hp300/config.c
index 6694c25..416d4de 100644
--- a/arch/m68k/hp300/config.c
+++ b/arch/m68k/hp300/config.c
@@ -73,9 +73,6 @@ void __init config_hp300(void)
   mach_get_irq_list    = show_hp300_interrupts;
   mach_gettimeoffset   = hp300_gettimeoffset;
   mach_default_handler = &hp300_default_handler;
-#if 0
-  mach_gettod          = hp300_gettod;
-#endif
   mach_reset           = hp300_reset;
 #ifdef CONFIG_HEARTBEAT
   mach_heartbeat       = hp300_pulse;
diff --git a/arch/m68k/kernel/setup.c b/arch/m68k/kernel/setup.c
index 57a954d..d794934 100644
--- a/arch/m68k/kernel/setup.c
+++ b/arch/m68k/kernel/setup.c
@@ -84,8 +84,7 @@ int (*mach_get_irq_list) (struct seq_file *, void *) = NULL;
 void (*mach_process_int) (int, struct pt_regs *) = NULL;
 /* machine dependent timer functions */
 unsigned long (*mach_gettimeoffset) (void);
-void (*mach_gettod) (int*, int*, int*, int*, int*, int*);
-int (*mach_hwclk) (int, struct hwclk_time*) = NULL;
+int (*mach_hwclk) (int, struct rtc_time*) = NULL;
 int (*mach_set_clock_mmss) (unsigned long) = NULL;
 void (*mach_reset)( void );
 void (*mach_halt)( void ) = NULL;
@@ -520,15 +519,6 @@ void __init kbd_reset_setup(char *str, int *ints)
 {
 }
 
-void arch_gettod(int *year, int *mon, int *day, int *hour,
-		 int *min, int *sec)
-{
-	if (mach_gettod)
-		mach_gettod(year, mon, day, hour, min, sec);
-	else
-		*year = *mon = *day = *hour = *min = *sec = 0;
-}
-
 void check_bugs(void)
 {
 #ifndef CONFIG_M68KFPU_EMU
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index af22bee..a845040 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -17,6 +17,7 @@
 #include <linux/param.h>
 #include <linux/string.h>
 #include <linux/mm.h>
+#include <linux/rtc.h>
 
 #include <asm/machdep.h>
 #include <asm/io.h>
@@ -104,17 +105,17 @@ static void timer_interrupt(int irq, void *dummy, struct pt_regs * regs)
 
 void time_init(void)
 {
-	unsigned int year, mon, day, hour, min, sec;
+	struct rtc_time time;
 
-	extern void arch_gettod(int *year, int *mon, int *day, int *hour,
-				int *min, int *sec);
+	if (mach_hwclk) {
+		mach_hwclk(0, &time);
 
-	arch_gettod (&year, &mon, &day, &hour, &min, &sec);
-
-	if ((year += 1900) < 1970)
-		year += 100;
-	xtime.tv_sec = mktime(year, mon, day, hour, min, sec);
-	xtime.tv_usec = 0;
+		if ((time.tm_year += 1900) < 1970)
+			time.tm_year += 100;
+		xtime.tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
+				      time.tm_hour, time.tm_min, time.tm_sec);
+		xtime.tv_usec = 0;
+	}
 
 	mach_sched_init(timer_interrupt);
 }
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 02b391d..0d5eca4 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -62,9 +62,8 @@ void *mac_env;		/* Loaded by the boot asm */
 unsigned long mac_orig_videoaddr;
 
 /* Mac specific timer functions */
-extern void mac_gettod (int *, int *, int *, int *, int *, int *);
 extern unsigned long mac_gettimeoffset (void);
-extern int mac_hwclk (int, struct hwclk_time *);
+extern int mac_hwclk (int, struct rtc_time *);
 extern int mac_set_clock_mmss (unsigned long);
 extern int show_mac_interrupts(struct seq_file *, void *);
 extern void iop_preinit(void);
@@ -243,8 +242,10 @@ void __init config_mac(void)
 	mach_default_handler = &mac_handlers;
 	mach_get_irq_list    = show_mac_interrupts;
 	mach_gettimeoffset   = mac_gettimeoffset;
-	mach_gettod          = mac_gettod;
+#warning move to adb/via init
+#if 0
 	mach_hwclk           = mac_hwclk;
+#endif
 	mach_set_clock_mmss	 = mac_set_clock_mmss;
 #if 0
 	mach_mksound         = mac_mksound;
diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index d507bc0..a0c487c 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -11,7 +11,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/time.h>
-
+#include <linux/rtc.h>
 #include <linux/mm.h>
 
 #include <linux/adb.h>
@@ -571,31 +571,11 @@ static void unmktime(unsigned long time, long offset,
 	return;
 }
 
-/*
- * Return the boot time for use in initializing the kernel clock.
- *
- * I'd like to read the hardware clock here but many machines read
- * the PRAM through ADB, and interrupts aren't initialized when this
- * is called so ADB obviously won't work.
- */
-
-void mac_gettod(int *yearp, int *monp, int *dayp,
-	       int *hourp, int *minp, int *secp)
-{
-	/* Yes the GMT bias is backwards.  It looks like Penguin is
-           screwing up the boottime it gives us... This works for me
-           in Canada/Eastern but it might be wrong everywhere else. */
-	unmktime(mac_bi_data.boottime, -mac_bi_data.gmtbias * 60,
-		yearp, monp, dayp, hourp, minp, secp);
-	/* For some reason this is off by one */
-	*monp = *monp + 1;
-}
-
 /* 
  * Read/write the hardware clock.
  */
 
-int mac_hwclk(int op, struct hwclk_time *t)
+int mac_hwclk(int op, struct rtc_time *t)
 {
 	unsigned long now;
 
@@ -613,19 +593,19 @@ int mac_hwclk(int op, struct hwclk_time *t)
 			now = 0;
 		}
 
-		t->wday = 0;
+		t->tm_wday = 0;
 		unmktime(now, 0,
-			 &t->year, &t->mon, &t->day,
-			 &t->hour, &t->min, &t->sec);
+			 &t->tm_year, &t->tm_mon, &t->tm_mday,
+			 &t->tm_hour, &t->tm_min, &t->tm_sec);
 		printk("mac_hwclk: read %04d-%02d-%-2d %02d:%02d:%02d\n",
-			t->year + 1900, t->mon + 1, t->day, t->hour, t->min, t->sec);
+			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
 	} else { /* write */
 		printk("mac_hwclk: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
-			t->year + 1900, t->mon + 1, t->day, t->hour, t->min, t->sec);
+			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
 
 #if 0	/* it trashes my rtc */
-		now = mktime(t->year + 1900, t->mon + 1, t->day,
-			     t->hour, t->min, t->sec);
+		now = mktime(t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+			     t->tm_hour, t->tm_min, t->tm_sec);
 
 		if (macintosh_config->adb_type == MAC_ADB_II) {
 			via_write_time(now);
@@ -648,11 +628,11 @@ int mac_hwclk(int op, struct hwclk_time *t)
 
 int mac_set_clock_mmss (unsigned long nowtime)
 {
-	struct hwclk_time now;
+	struct rtc_time now;
 
 	mac_hwclk(0, &now);
-	now.sec = nowtime % 60;
-	now.min = (nowtime / 60) % 60;
+	now.tm_sec = nowtime % 60;
+	now.tm_min = (nowtime / 60) % 60;
 	mac_hwclk(1, &now);
 
 	return 0;
diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index e0fc27d..211c1e2 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -46,9 +46,7 @@ extern void mvme147_sched_init(void (*handler)(int, void *, struct pt_regs *));
 extern int mvme147_keyb_init(void);
 extern int mvme147_kbdrate (struct kbd_repeat *);
 extern unsigned long mvme147_gettimeoffset (void);
-extern void mvme147_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec);
-extern int mvme147_hwclk (int, struct hwclk_time *);
+extern int mvme147_hwclk (int, struct rtc_time *);
 extern int mvme147_set_clock_mmss (unsigned long);
 extern void mvme147_check_partition (struct gendisk *hd, unsigned int dev);
 extern void mvme147_reset (void);
@@ -107,7 +105,6 @@ void __init config_mvme147(void)
 	mach_kbdrate		= mvme147_kbdrate;
 	mach_init_IRQ		= mvme147_init_IRQ;
 	mach_gettimeoffset	= mvme147_gettimeoffset;
-	mach_gettod		= mvme147_gettod;
 	mach_hwclk		= mvme147_hwclk;
 	mach_set_clock_mmss	= mvme147_set_clock_mmss;
 	mach_reset		= mvme147_reset;
@@ -166,26 +163,24 @@ unsigned long mvme147_gettimeoffset (void)
 	return (unsigned long)n * 25 / 4;
 }
 
-extern void mvme147_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec)
-{
-	m147_rtc->ctrl = RTC_READ;
-	*year = bcd2int (m147_rtc->bcd_year);
-	*mon = bcd2int (m147_rtc->bcd_mth);
-	*day = bcd2int (m147_rtc->bcd_dom);
-	*hour = bcd2int (m147_rtc->bcd_hr);
-	*min = bcd2int (m147_rtc->bcd_min);
-	*sec = bcd2int (m147_rtc->bcd_sec);
-	m147_rtc->ctrl = 0;
-}
-
 static int bcd2int (unsigned char b)
 {
 	return ((b>>4)*10 + (b&15));
 }
 
-int mvme147_hwclk(int op, struct hwclk_time *t)
+int mvme147_hwclk(int op, struct rtc_time *t)
 {
+#warning check me!
+	if (!op) {
+		m147_rtc->ctrl = RTC_READ;
+		t->tm_year = bcd2int (m147_rtc->bcd_year);
+		t->tm_mon  = bcd2int (m147_rtc->bcd_mth);
+		t->tm_mday = bcd2int (m147_rtc->bcd_dom);
+		t->tm_hour = bcd2int (m147_rtc->bcd_hr);
+		t->tm_min  = bcd2int (m147_rtc->bcd_min);
+		t->tm_sec  = bcd2int (m147_rtc->bcd_sec);
+		m147_rtc->ctrl = 0;
+	}
 	return 0;
 }
 
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 70fa43a..528c24a 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -50,9 +50,7 @@ extern void mvme16x_sched_init(void (*handler)(int, void *, struct pt_regs *));
 extern int  mvme16x_keyb_init(void);
 extern int  mvme16x_kbdrate (struct kbd_repeat *);
 extern unsigned long mvme16x_gettimeoffset (void);
-extern void mvme16x_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec);
-extern int mvme16x_hwclk (int, struct hwclk_time *);
+extern int mvme16x_hwclk (int, struct rtc_time *);
 extern int mvme16x_set_clock_mmss (unsigned long);
 extern void mvme16x_check_partition (struct gendisk *hd, unsigned int dev);
 extern void mvme16x_mksound( unsigned int count, unsigned int ticks );
@@ -149,7 +147,6 @@ void __init config_mvme16x(void)
     mach_kbdrate         = mvme16x_kbdrate;
     mach_init_IRQ        = mvme16x_init_IRQ;
     mach_gettimeoffset   = mvme16x_gettimeoffset;
-    mach_gettod  	 = mvme16x_gettod;
     mach_hwclk           = mvme16x_hwclk;
     mach_set_clock_mmss	 = mvme16x_set_clock_mmss;
 /*  kd_mksound           = mvme16x_mksound; */
@@ -273,26 +270,24 @@ unsigned long mvme16x_gettimeoffset (void)
     return (*(volatile unsigned long *)0xfff42008);
 }
 
-extern void mvme16x_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec)
-{
-	rtc->ctrl = RTC_READ;
-	*year = bcd2int (rtc->bcd_year);
-	*mon = bcd2int (rtc->bcd_mth);
-	*day = bcd2int (rtc->bcd_dom);
-	*hour = bcd2int (rtc->bcd_hr);
-	*min = bcd2int (rtc->bcd_min);
-	*sec = bcd2int (rtc->bcd_sec);
-	rtc->ctrl = 0;
-}
-
 int bcd2int (unsigned char b)
 {
 	return ((b>>4)*10 + (b&15));
 }
 
-int mvme16x_hwclk(int op, struct hwclk_time *t)
+int mvme16x_hwclk(int op, struct rtc_time *t)
 {
+#warning check me!
+	if (!op) {
+		rtc->ctrl = RTC_READ;
+		t->tm_year = bcd2int (rtc->bcd_year);
+		t->tm_mon  = bcd2int (rtc->bcd_mth);
+		t->tm_mday = bcd2int (rtc->bcd_dom);
+		t->tm_hour = bcd2int (rtc->bcd_hr);
+		t->tm_min  = bcd2int (rtc->bcd_min);
+		t->tm_sec  = bcd2int (rtc->bcd_sec);
+		rtc->ctrl = 0;
+	}
 	return 0;
 }
 
diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index d361b8f..c35f214 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/major.h>
 #include <linux/serial_reg.h>
+#include <linux/rtc.h>
 
 #include <asm/io.h>
 #include <asm/rtc.h>
@@ -53,9 +54,7 @@ extern int  q40_request_irq(unsigned int irq, void (*handler)(int, void *, struc
 extern void q40_sched_init(void (*handler)(int, void *, struct pt_regs *));
 
 extern unsigned long q40_gettimeoffset (void);
-extern void q40_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec);
-extern int q40_hwclk (int, struct hwclk_time *);
+extern int q40_hwclk (int, struct rtc_time *);
 extern int q40_set_clock_mmss (unsigned long);
 extern void q40_reset (void);
 void q40_halt(void);
@@ -226,7 +225,6 @@ void __init config_q40(void)
     mach_kbd_translate   = q40kbd_translate;
     mach_init_IRQ        = q40_init_IRQ;   
     mach_gettimeoffset   = q40_gettimeoffset; 
-    mach_gettod  	 = q40_gettod;
     mach_hwclk           = q40_hwclk; 
     mach_set_clock_mmss	 = q40_set_clock_mmss;
 
@@ -292,21 +290,6 @@ unsigned long q40_gettimeoffset (void)
     return 5000*(ql_ticks!=0);
 }
 
-extern void q40_gettod (int *year, int *mon, int *day, int *hour,
-                           int *min, int *sec)
-{
-	RTC_CTRL |= RTC_READ;
-	*year = bcd2bin (RTC_YEAR);
-	*mon = bcd2bin (RTC_MNTH);
-	*day = bcd2bin (RTC_DATE);
-	*hour = bcd2bin (RTC_HOUR);
-	*min = bcd2bin (RTC_MINS);
-	*sec = bcd2bin (RTC_SECS);
-	RTC_CTRL &= ~(RTC_READ);
-
-}
-
-
 
 /*
  * Looks like op is non-zero for setting the clock, and zero for
@@ -323,39 +306,39 @@ extern void q40_gettod (int *year, int *mon, int *day, int *hour,
  * };
  */
 
-int q40_hwclk(int op, struct hwclk_time *t)
+int q40_hwclk(int op, struct rtc_time *t)
 {
         if (op)
 	{	/* Write.... */
-	        RTC_CTRL |= RTC_WRITE;
-
-		RTC_SECS = bin2bcd(t->sec);
-		RTC_MINS = bin2bcd(t->min);
-		RTC_HOUR = bin2bcd(t->hour);
-		RTC_DATE = bin2bcd(t->day);
-		RTC_MNTH = bin2bcd(t->mon + 1);
-		RTC_YEAR = bin2bcd(t->year%100);
-		if (t->wday >= 0)
-			RTC_DOW = bin2bcd(t->wday+1);
-
-	        RTC_CTRL &= ~(RTC_WRITE);
+	        Q40_RTC_CTRL |= Q40_RTC_WRITE;
+
+		Q40_RTC_SECS = bin2bcd(t->tm_sec);
+		Q40_RTC_MINS = bin2bcd(t->tm_min);
+		Q40_RTC_HOUR = bin2bcd(t->tm_hour);
+		Q40_RTC_DATE = bin2bcd(t->tm_mday);
+		Q40_RTC_MNTH = bin2bcd(t->tm_mon + 1);
+		Q40_RTC_YEAR = bin2bcd(t->tm_year%100);
+		if (t->tm_wday >= 0)
+			Q40_RTC_DOW = bin2bcd(t->tm_wday+1);
+
+	        Q40_RTC_CTRL &= ~(Q40_RTC_WRITE);
 	}
 	else
 	{	/* Read....  */
-	  RTC_CTRL |= RTC_READ;
+	  Q40_RTC_CTRL |= Q40_RTC_READ;
 
-	  t->year = bcd2bin (RTC_YEAR);
-	  t->mon  = bcd2bin (RTC_MNTH)-1;
-	  t->day  = bcd2bin (RTC_DATE);
-	  t->hour = bcd2bin (RTC_HOUR);
-	  t->min  = bcd2bin (RTC_MINS);
-	  t->sec  = bcd2bin (RTC_SECS);
+	  t->tm_year = bcd2bin (Q40_RTC_YEAR);
+	  t->tm_mon  = bcd2bin (Q40_RTC_MNTH)-1;
+	  t->tm_mday = bcd2bin (Q40_RTC_DATE);
+	  t->tm_hour = bcd2bin (Q40_RTC_HOUR);
+	  t->tm_min  = bcd2bin (Q40_RTC_MINS);
+	  t->tm_sec  = bcd2bin (Q40_RTC_SECS);
 
-	  RTC_CTRL &= ~(RTC_READ);
+	  Q40_RTC_CTRL &= ~(Q40_RTC_READ);
 	  
-	  if (t->year < 70)
-	    t->year += 100;
-	  t->wday = bcd2bin(RTC_DOW)-1;
+	  if (t->tm_year < 70)
+	    t->tm_year += 100;
+	  t->tm_wday = bcd2bin(Q40_RTC_DOW)-1;
 
 	}
 
@@ -375,16 +358,16 @@ int q40_set_clock_mmss (unsigned long nowtime)
 	int rtc_minutes;
 
 
-	rtc_minutes = bcd2bin (RTC_MINS);
+	rtc_minutes = bcd2bin (Q40_RTC_MINS);
 
 	if ((rtc_minutes < real_minutes
 		? real_minutes - rtc_minutes
 			: rtc_minutes - real_minutes) < 30)
 	{	   
-	        RTC_CTRL |= RTC_WRITE;
-		RTC_MINS = bin2bcd(real_minutes);
-		RTC_SECS = bin2bcd(real_seconds);
-		RTC_CTRL &= ~(RTC_WRITE);
+	        Q40_RTC_CTRL |= Q40_RTC_WRITE;
+		Q40_RTC_MINS = bin2bcd(real_minutes);
+		Q40_RTC_SECS = bin2bcd(real_seconds);
+		Q40_RTC_CTRL &= ~(Q40_RTC_WRITE);
 	}
 	else
 		retval = -1;
diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index 7835991..71ebaa8 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -146,12 +146,12 @@ void __init config_sun3(void)
         disable_irq  	     =  sun3_disable_irq;
 	mach_process_int     =  sun3_process_int;
         mach_get_irq_list    =  show_sun3_interrupts;
-        mach_gettod          =  sun3_gettod;	
         mach_reset           =  sun3_reboot;
 	mach_gettimeoffset   =  sun3_gettimeoffset;
 	mach_get_model	     =  sun3_get_model;
 	mach_hwclk           =  sun3_hwclk;
 	mach_halt	     =  sun3_halt;
+	mach_get_hardware_list = sun3_get_hardware_list;
 #if !defined(CONFIG_SERIAL_CONSOLE) && defined(CONFIG_FB)
 	conswitchp 	     = &dummy_con;
 #endif
diff --git a/arch/m68k/sun3/intersil.c b/arch/m68k/sun3/intersil.c
index 52493eb..81ff083 100644
--- a/arch/m68k/sun3/intersil.c
+++ b/arch/m68k/sun3/intersil.c
@@ -11,8 +11,10 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/rtc.h>
 
 #include <asm/system.h>
+#include <asm/semaphore.h>
 #include <asm/rtc.h>
 #include <asm/intersil.h>
 
@@ -27,37 +29,10 @@ unsigned long sun3_gettimeoffset(void)
   return 1;
 }
 
-void sun3_gettod (int *yearp, int *monp, int *dayp,
-                   int *hourp, int *minp, int *secp)
-{
-	unsigned char wday;
-	volatile struct intersil_dt* todintersil;
-	unsigned long flags;
-
-        todintersil = (struct intersil_dt *) &intersil_clock->counter;
-
-	save_and_cli(flags);
-
-	intersil_clock->cmd_reg = STOP_VAL;
-
-	*secp  = todintersil->csec;
-        *hourp = todintersil->hour;
-        *minp  = todintersil->minute;
-        *secp  = todintersil->second; 
-        *monp  = todintersil->month;
-        *dayp  = todintersil->day;
-        *yearp = todintersil->year+68; /* The base year for sun3 is 1968 */
-	wday = todintersil->weekday;
-
-	intersil_clock->cmd_reg = START_VAL;
-
-	restore_flags(flags);
-}
-
 
 /* get/set hwclock */
 
-int sun3_hwclk(int set, struct hwclk_time *t)
+int sun3_hwclk(int set, struct rtc_time *t)
 {
 	volatile struct intersil_dt *todintersil;
 	unsigned long flags;
@@ -71,23 +46,23 @@ int sun3_hwclk(int set, struct hwclk_time *t)
 	/* set or read the clock */
 	if(set) {
 		todintersil->csec = 0;
-		todintersil->hour = t->hour;
-		todintersil->minute = t->min;
-		todintersil->second = t->sec;
-		todintersil->month = t->mon;
-		todintersil->day = t->day;
-		todintersil->year = t->year - 68;
-		todintersil->weekday = t->wday;
+		todintersil->hour = t->tm_hour;
+		todintersil->minute = t->tm_min;
+		todintersil->second = t->tm_sec;
+		todintersil->month = t->tm_mon;
+		todintersil->day = t->tm_mday;
+		todintersil->year = t->tm_year - 68;
+		todintersil->weekday = t->tm_wday;
 	} else {
 		/* read clock */
-		t->sec = todintersil->csec;
-		t->hour = todintersil->hour;
-		t->min = todintersil->minute;
-		t->sec = todintersil->second;
-		t->mon = todintersil->month;
-		t->day = todintersil->day;
-		t->year = todintersil->year + 68;
-		t->wday = todintersil->weekday;
+		t->tm_sec = todintersil->csec;
+		t->tm_hour = todintersil->hour;
+		t->tm_min = todintersil->minute;
+		t->tm_sec = todintersil->second;
+		t->tm_mon = todintersil->month;
+		t->tm_mday = todintersil->day;
+		t->tm_year = todintersil->year + 68;
+		t->tm_wday = todintersil->weekday;
 	}
 
 	intersil_clock->cmd_reg = START_VAL;
diff --git a/arch/m68k/sun3x/config.c b/arch/m68k/sun3x/config.c
index 0e5fc55..8f3a66a 100644
--- a/arch/m68k/sun3x/config.c
+++ b/arch/m68k/sun3x/config.c
@@ -77,9 +77,9 @@ void __init config_sun3x(void)
 	mach_gettimeoffset   = sun3x_gettimeoffset;
 	mach_reset           = sun3x_reboot;
 
-	mach_gettod          = sun3x_gettod;
 	mach_hwclk           = sun3x_hwclk;
-	mach_get_model       = sun3x_get_model;
+	mach_get_model       = sun3_get_model;
+	mach_get_hardware_list = sun3x_get_hardware_list;
 
 	sun3_intreg = (unsigned char *)SUN3X_INTREG;
 
diff --git a/arch/m68k/sun3x/time.c b/arch/m68k/sun3x/time.c
index 6633c1d..bd896d4 100644
--- a/arch/m68k/sun3x/time.c
+++ b/arch/m68k/sun3x/time.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
+#include <linux/rtc.h>
 
 #include <asm/irq.h>
 #include <asm/io.h>
@@ -38,54 +39,33 @@
 #define BCD_TO_BIN(val) (((val)&15) + ((val)>>4)*10)
 #define BIN_TO_BCD(val) (((val/10) << 4) | (val % 10))
 
-/* Read the Mostek */
-void sun3x_gettod (int *yearp, int *monp, int *dayp,
-                   int *hourp, int *minp, int *secp)
-{
-    volatile unsigned char *eeprom = (unsigned char *)SUN3X_EEPROM;
-
-    /* Stop updates */
-    *(eeprom + M_CONTROL) |= C_READ;
-
-    /* Read values */
-    *yearp = BCD_TO_BIN(*(eeprom + M_YEAR));
-    *monp  = BCD_TO_BIN(*(eeprom + M_MONTH)) +1;
-    *dayp  = BCD_TO_BIN(*(eeprom + M_DATE));
-    *hourp = BCD_TO_BIN(*(eeprom + M_HOUR));
-    *minp  = BCD_TO_BIN(*(eeprom + M_MIN));
-    *secp  = BCD_TO_BIN(*(eeprom + M_SEC));
-
-    /* Restart updates */
-    *(eeprom + M_CONTROL) &= ~C_READ;
-}
-
-int sun3x_hwclk(int set, struct hwclk_time *t)
+int sun3x_hwclk(int set, struct rtc_time *t)
 {
 	volatile struct mostek_dt *h = 
-		(unsigned char *)(SUN3X_EEPROM+M_CONTROL);
+		(struct mostek_dt *)(SUN3X_EEPROM+M_CONTROL);
 	unsigned long flags;
 
 	save_and_cli(flags);
 	
 	if(set) {
 		h->csr |= C_WRITE;
-		h->sec = BIN_TO_BCD(t->sec);
-		h->min = BIN_TO_BCD(t->min);
-		h->hour = BIN_TO_BCD(t->hour);
-		h->wday = BIN_TO_BCD(t->wday);
-		h->mday = BIN_TO_BCD(t->day);
-		h->month = BIN_TO_BCD(t->mon);
-		h->year = BIN_TO_BCD(t->year);
+		h->sec = BIN_TO_BCD(t->tm_sec);
+		h->min = BIN_TO_BCD(t->tm_min);
+		h->hour = BIN_TO_BCD(t->tm_hour);
+		h->wday = BIN_TO_BCD(t->tm_wday);
+		h->mday = BIN_TO_BCD(t->tm_mday);
+		h->month = BIN_TO_BCD(t->tm_mon);
+		h->year = BIN_TO_BCD(t->tm_year);
 		h->csr &= ~C_WRITE;
 	} else {
 		h->csr |= C_READ;
-		t->sec = BCD_TO_BIN(h->sec);
-		t->min = BCD_TO_BIN(h->min);
-		t->hour = BCD_TO_BIN(h->hour);
-		t->wday = BCD_TO_BIN(h->wday);
-		t->day = BCD_TO_BIN(h->mday);
-		t->mon = BCD_TO_BIN(h->month);
-		t->year = BCD_TO_BIN(h->year);
+		t->tm_sec = BCD_TO_BIN(h->sec);
+		t->tm_min = BCD_TO_BIN(h->min);
+		t->tm_hour = BCD_TO_BIN(h->hour);
+		t->tm_wday = BCD_TO_BIN(h->wday);
+		t->tm_mday = BCD_TO_BIN(h->mday);
+		t->tm_mon = BCD_TO_BIN(h->month);
+		t->tm_year = BCD_TO_BIN(h->year);
 		h->csr &= ~C_READ;
 	}
 
diff --git a/arch/m68k/sun3x/time.h b/arch/m68k/sun3x/time.h
index 54f5435..ad8c9fc 100644
--- a/arch/m68k/sun3x/time.h
+++ b/arch/m68k/sun3x/time.h
@@ -1,9 +1,7 @@
 #ifndef SUN3X_TIME_H
 #define SUN3X_TIME_H
 
-extern void sun3x_gettod (int *yearp, int *monp, int *dayp,
-                   int *hourp, int *minp, int *secp);
-extern int sun3x_hwclk(int set, struct hwclk_time *t);
+extern int sun3x_hwclk(int set, struct rtc_time *t);
 unsigned long sun3x_gettimeoffset (void);
 void sun3x_sched_init(void (*vector)(int, void *, struct pt_regs *));
 
diff --git a/include/asm-m68k/machdep.h b/include/asm-m68k/machdep.h
index b7c3f7a..f809c7d 100644
--- a/include/asm-m68k/machdep.h
+++ b/include/asm-m68k/machdep.h
@@ -6,7 +6,7 @@
 struct pt_regs;
 struct kbd_repeat;
 struct mktime;
-struct hwclk_time;
+struct rtc_time;
 struct buffer_head;
 
 extern void (*mach_sched_init) (void (*handler)(int, void *, struct pt_regs *));
@@ -27,9 +27,7 @@ extern int (*mach_get_irq_list) (struct seq_file *p, void *v);
 extern void (*mach_process_int) (int irq, struct pt_regs *fp);
 /* machine dependent timer functions */
 extern unsigned long (*mach_gettimeoffset)(void);
-extern void (*mach_gettod)(int *year, int *mon, int *day, int *hour,
-			   int *min, int *sec);
-extern int (*mach_hwclk)(int, struct hwclk_time*);
+extern int (*mach_hwclk)(int, struct rtc_time*);
 extern int (*mach_set_clock_mmss)(unsigned long);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
diff --git a/include/asm-m68k/rtc.h b/include/asm-m68k/rtc.h
index 0ae2c24..b28f547 100644
--- a/include/asm-m68k/rtc.h
+++ b/include/asm-m68k/rtc.h
@@ -13,17 +13,7 @@
 
 #ifdef __KERNEL__
 
-#include <linux/config.h>
-
-struct hwclk_time {
-	unsigned	sec;	/* 0..59 */
-	unsigned	min;	/* 0..59 */
-	unsigned	hour;	/* 0..23 */
-	unsigned	day;	/* 1..31 */
-	unsigned	mon;	/* 0..11 */
-	unsigned	year;	/* 70... */
-	int		wday;	/* 0..6, 0 is Sunday, -1 means unknown/don't set */
-};
+#include <asm/machdep.h>
 
 /* a few implementation details for the emulation : */
 
diff --git a/include/linux/kd.h b/include/linux/kd.h
index 2461c05..986ef61 100644
--- a/include/linux/kd.h
+++ b/include/linux/kd.h
@@ -132,19 +132,6 @@ struct kbkeycode {
 
 #define KDSIGACCEPT	0x4B4E	/* accept kbd generated signals */
 
-struct hwclk_time {
-	unsigned	sec;	/* 0..59 */
-	unsigned	min;	/* 0..59 */
-	unsigned	hour;	/* 0..23 */
-	unsigned	day;	/* 1..31 */
-	unsigned	mon;	/* 0..11 */
-	unsigned	year;	/* 70... */
-	int		wday;	/* 0..6, 0 is Sunday, -1 means unknown/don't set */
-};
-
-#define KDGHWCLK        0x4B50	/* get hardware clock */
-#define KDSHWCLK        0x4B51  /* set hardware clock */
-
 struct kbd_repeat {
 	int delay;	/* in msec; <= 0: don't change */
 	int rate;	/* in msec; <= 0: don't change */

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
