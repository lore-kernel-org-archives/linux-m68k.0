Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3251BC07E9D
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 14:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbiIZOjr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234782AbiIZOiy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 10:38:54 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0344C80BE1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 06:00:54 -0700 (PDT)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLyzP-1ouC7O3im9-00Hxnb; Mon, 26 Sep 2022 15:00:44 +0200
Message-ID: <2a8cee1f-2d80-68fc-0ea9-be370a941ede@vivier.eu>
Date:   Mon, 26 Sep 2022 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: fr
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
From:   Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
In-Reply-To: <20220926113900.1256630-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ktqx4pVnXEaPHBKuTmykj3MP9987MeqkfOg9WcCzD2bbsluqOLu
 yjIhiC5FN+W4T2txfaec9+gn/R1ZHzuk5vtRzxLPMDqbbpVr+0TLx54gnphZpuKap0SfxNo
 cR/Z+gSX5v8hkLkZj6tHGk+U1RRvMRyBSaXg1LUXXY1lC1G7Yt3NK2l4XHCzPRSxqfSA/gF
 rAIADTj+ab4/htxrJSAHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kp0vmBPYg94=:zBL0yvNQYCcmWHOhOYjMB4
 PseQjbZHYgXYnFzk/vJP9CeUCtLvuk9GKAZ1A875rJZ6Kv6DjEufWHQ/h16rBLWHPdou5h4rx
 QPMCldnkopw+rV4Tc9mO/0PnHlxXvw69Bvr5kyFXLlIOV4F8GJRibKggAlxnM4SGrlkhQ7gMA
 cpVhF4I1Bh4uOLfrD3GPO1WIPVyOQff8r+0obuIP1kPI5dvSqg4jg9lKMa0fi31DVkGMPGiCv
 JOzQ1wXPJB/Zf6uyU+JWPt66Hdi2sTXvck4lsBpWGnpU/XuCLXLIdf47nLfkE8MbndK6cPrWG
 ykrCMv/CTE5IkFFOHsYzOT7w3MDgMWh1B2eY8InM8XBhDaGthkewFOXjPcUgfCU1sMysUxDAy
 lpbpcMiDaGnqcHksCPaVBmd9JCdQk7PDob7oZmdereO62YGmecyt3wldalWakjNS7A52hmVnX
 C76E1rrZU1e5I3uVscsXo7vRf4kbeOaYKl8kmDRWjrjlafaVHfCJNBuYTRPIHreUuvspyduYX
 CiO1P5VIqHvmNsb9PkNnI9kk9CRXKCMralqmf9BuDdf0p+WfDx0JKMzw7kdCC93EMKhhnZ3lc
 1caCHYPD8fb8vA+gDCUNnyK863wV5sbzILeGTNLfFKTz1etC2xoTBbZRhvMVAM2RELz9H12j4
 7kQl+9+4ZDRg2+MiYQAR4vXtVg77pfbaa7Eq/A2SbE3Er1mfWDNbw/16FJIUwfviupCi+0cZ0
 epyWPAfmkaJ3oSJZWgdIts1D/vPa4Jc5snZLCRQ2luaZfKJJcqttNn17Bxwy8BkHA85ykERup
 gLUZ7LY
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> padding to fill this out as such.

Agree, I found the same problem using petitboot as a ROM for the virt machine [1].
(I didn't update BOOTINFOSTR() but I think I should).

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

[1] https://github.com/vivier/qemu-m68k/commits/m68k-virt
> 
> Also, break apart the padding additions from the other field length
> additions, so that it's more clear why these magic numbers are being
> added, and comment them too.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/m68k/bootinfo.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
> index bd8b212fd3..897162b818 100644
> --- a/hw/m68k/bootinfo.h
> +++ b/hw/m68k/bootinfo.h
> @@ -48,13 +48,14 @@
>           stw_phys(as, base, id); \
>           base += 2; \
>           stw_phys(as, base, \
> -                 (sizeof(struct bi_record) + strlen(string) + 2) & ~1); \
> +                 (sizeof(struct bi_record) + strlen(string) + \
> +                  1 /* null termination */ + 3 /* padding */) & ~3); \
>           base += 2; \
>           for (i = 0; string[i]; i++) { \
>               stb_phys(as, base++, string[i]); \
>           } \
>           stb_phys(as, base++, 0); \
> -        base = (base + 1) & ~1; \
> +        base = (base + 3) & ~3; \
>       } while (0)
>   
>   #define BOOTINFODATA(as, base, id, data, len) \
> @@ -63,13 +64,14 @@
>           stw_phys(as, base, id); \
>           base += 2; \
>           stw_phys(as, base, \
> -                 (sizeof(struct bi_record) + len + 3) & ~1); \
> +                 (sizeof(struct bi_record) + len + \
> +                  2 /* length field */ + 3 /* padding */) & ~3); \
>           base += 2; \
>           stw_phys(as, base, len); \
>           base += 2; \
>           for (i = 0; i < len; ++i) { \
>               stb_phys(as, base++, data[i]); \
>           } \
> -        base = (base + 1) & ~1; \
> +        base = (base + 3) & ~3; \
>       } while (0)
>   #endif

