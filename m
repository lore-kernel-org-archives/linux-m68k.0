From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Thu, 10 Aug 2017 17:06:01 +1000
Message-ID: <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------45937291D1746C5278D3744F"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out2.external.iinet.net.au ([203.59.1.155]:20072
        "EHLO icp-osb-irony-out2.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752353AbdHJHGC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 10 Aug 2017 03:06:02 -0400
In-Reply-To: <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------45937291D1746C5278D3744F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 10/08/17 01:32, Angelo Dureghello wrote:
[snip]
> sure, on this board  http://sysam.it/cff_stmark2.html
> there are 128MB of ddr2.
> 
> External SDRAM is accessible, at least without any mmc support enabled,
> from 0x40000000.
> 
> I have following test config:
> 
>   GNU nano 2.8.6                                                                              File: arch/m68k/configs/stmark2_defconfig
> 
> CONFIG_LOCALVERSION="stmark2-001"
[snip]
> 
> 
> I tried still yesterday a bit, but seems there is no much support for
> earlyprintk / low level debug for this architecture.
> 
> In case i can try with a gpio toggling routine, at least to find
> where kernel stops.

The attached patch, is a quick and dirty early console output method.
It works for me on the m5475, should work for you "as is" on the 5441x too.

It is kind of an early printk. Of course it still needs the early
kernel boot to have succeeded before you will get anything much coming out.
But it is worth trying.

I am wondering if the non-0 base RAM may be a problem. I have only run
the MMU enabled code on platforms with 0 based RAM so far. But lets see if
the early console trace attached gives us anything before digging into that.

Regards
Greg

--------------45937291D1746C5278D3744F
Content-Type: text/x-patch;
 name="console.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="console.patch"

diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 02eb322..58b854e 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -568,6 +568,30 @@ static int __init mcf_console_setup(struct console *co, char *options)
 
 /****************************************************************************/
 
+static void putrawch(char c)
+{
+	unsigned int membase = MCFUART_BASE0;
+	int i;
+
+	for (i = 0; (i < 0x10000); i++) {
+		if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
+			break;
+	}
+	writeb(c, membase + MCFUART_UTB);
+	for (i = 0; (i < 0x10000); i++) {
+		if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
+			break;
+	}
+}
+
+void printraw(const char *s)
+{
+	for (; *s != 0; s++)
+		putrawch(*s);
+}
+
+/****************************************************************************/
+
 static struct uart_driver mcf_driver;
 
 static struct console mcf_console = {
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2984fb0..39e62d1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1721,6 +1721,8 @@ asmlinkage int vprintk_emit(int facility, int level,
 	 */
 	text_len = vscnprintf(text, sizeof(textbuf), fmt, args);
 
+	{ extern void printraw(const char *); printraw(text); }
+
 	/* mark and strip a trailing newline */
 	if (text_len && text[text_len-1] == '\n') {
 		text_len--;

--------------45937291D1746C5278D3744F--
