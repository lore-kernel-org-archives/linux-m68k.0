From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 05/11] m68k/atari: Add missing platform check before registering
 platform devices
Date: Sun, 25 Mar 2012 16:46:22 +1300
Message-ID: <4F6E950E.30809__49208.1553362825$1332647650$gmane$org@gmail.com>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org> <1332323515-7314-5-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332323515-7314-5-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Geert,
> On multi-platform kernels, the Atari platform devices should be registered
> when running on Atari only. Else it may crash later.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/atari/config.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
> index af78731..35fb81d 100644
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -693,6 +693,9 @@ static struct platform_device *atari_platform_devices[] __initdata = {
>  
>  int __init atari_platform_init(void)
>  {
> +	if (!MACH_IS_ATARI)
> +		return -ENODEV;
> +
>  	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
>  }
>  
>   

How about this instead - probe for the EtherNAT config register, and 
register devices only if found?

(may apply with a bit of fuzz)

Otherwise, Acked-by: Michael Schmitz <schmitz@debian.org>.

--- arch/m68k/atari/config.c.org    2012-03-25 16:02:12.000000000 +1300
+++ arch/m68k/atari/config.c    2012-03-25 13:37:21.000000000 +1300
@@ -753,7 +753,19 @@
 
 int __init atari_platform_init(void)
 {
-    return platform_add_devices(atari_platform_devices, 
ARRAY_SIZE(atari_platform_devices));
+    if (MACH_IS_ATARI) {
+        u8 ethernat_cr;
+        unsigned long enatc_phys = 0x80000023;
+        unsigned char *enatc_virt;
+       
+        enatc_virt = (unsigned char *)ioremap(enatc_phys, 0xf);
+        if (hwreg_present(enatc_virt)) {
+            iounmap(enatc_virt);
+            return platform_add_devices(atari_platform_devices, 
ARRAY_SIZE(atari_platform_devices));
+        }
+        iounmap(enatc_virt);
+    }
+    return -ENODEV;   
 }
 
 arch_initcall(atari_platform_init);
