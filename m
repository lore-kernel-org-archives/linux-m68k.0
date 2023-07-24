Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A29C0015E
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 05:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjGXFep (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 01:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjGXFeo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 01:34:44 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA2AE41
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 22:34:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8b4748fe4so21397525ad.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 22:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690176881; x=1690781681;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrRCs9J9cuqFytw0CPsTvJ0/VgtZFNZF2StTT2ELhYQ=;
        b=QNd/QcPvcruooUOIbD5r6HqalozOx29e4KE4dL4CktOGQTb8pvqoAas1HziuVSBmRi
         ONZzaGCN5OnsPEXFNrK+EL0JjW/Q35tesDHqKlv77NudflLqq9fe8kwKxklLVs6L+/jk
         uMBGeu3j2eB5FZ5RQuO4Y7RyWThlGaCNnZFfSKEPgj4pz3B9L2rooB6iu6DBx4i/QqBT
         FylWcPrrs1xbjZGDQK/yIs4F9xfxIEjIHNgrkeNi5WB1+2qQEmUaV4+WJz9cUuL06BpT
         Uxzd2ugL6q9wMfoAzh2XIfVqNN+jc8RseYguWsBKntzh7Oe2SXwGXW8I4zknRu+C6YF+
         5LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690176881; x=1690781681;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CrRCs9J9cuqFytw0CPsTvJ0/VgtZFNZF2StTT2ELhYQ=;
        b=ZWjIteyjQ2srqtlJ4i7aUClFP/Hl5WxiVOs74FpgInSrCPlhUdUlqSLz2Qd24eh8Tt
         yLM9VibqmTeYYg7jqmnXjlQ8tD985nEdrMtJ1rOVvjhjBLLbbhBtkhEv4DEhBjC2fdSQ
         qy1jL2C/US+PsWAJ4ayvQlUbwMQG5GreW0O/V2vYCO5CYAmbga6IZrWLwMqsrIWaZtMI
         QqjLdg1PHUX/MBXowZQBDcR/2e03idcmZjifW7DENbFdTMNmYClrkT9uKSNq1OoEPlLp
         RNbW8YVYZWp+z2Phx+UinNVrOnFIrxjqNXLwoMf0EscbE6v8KcaUXum76KBVmVxvkIhQ
         UGQw==
X-Gm-Message-State: ABy/qLZ0vC9ATFn4/ptqlSXWNe+FrurHoQ2TqU119KwYm21xJDCNH/Oa
        qWKYm0QeGElcdM94cHzdaKs=
X-Google-Smtp-Source: APBJJlGYQmm1yrikG0bziSH6O/bk592oPBNWHtfn+yfH3VGi/UD+ryBeFDTfYs8FpGzJ+DcBkJM5Ww==
X-Received: by 2002:a17:90a:d803:b0:268:a26:d9ee with SMTP id a3-20020a17090ad80300b002680a26d9eemr3112946pjv.46.1690176880778;
        Sun, 23 Jul 2023 22:34:40 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.googlemail.com with ESMTPSA id s26-20020a63a31a000000b0055c178a8df1sm7394104pge.94.2023.07.23.22.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 22:34:40 -0700 (PDT)
Subject: Re: [PATCH] m68knommu: Fix warnings in io_no.h: Delete one of
 repeated word 'readw readl writew writel' in comment. WARNING: Possible
 repeated word: 'readw' WARNING: Possible repeated word: 'readl' WARNING:
 Possible repeated word: 'writew' WARNING: Possible repeated word: 'writel'
To:     huzhi001@208suo.com, gerg@linux-m68k.org, geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <tencent_816D5035481D1083943D8E965A59860D5E06@qq.com>
 <9e13fec02524afde21bdf5783dcf7246@208suo.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b0c9bf6d-786d-29b8-7811-e132534227fe@gmail.com>
Date:   Mon, 24 Jul 2023 17:34:34 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9e13fec02524afde21bdf5783dcf7246@208suo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

please reconsider - "#define something something" is legitimate use, and
quite intentional.

Pattern matching can only get you so far, sorry ...

Cheers,

    Michael

Am 24.07.23 um 12:40 schrieb huzhi001@208suo.com:
> Signed-off-by: ZhiHu <huzhi001@208suo.com>
> ---
>  arch/m68k/include/asm/io_no.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/io_no.h
> b/arch/m68k/include/asm/io_no.h
> index 2c96e8480173..b24eb741e666 100644
> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -62,7 +62,7 @@ static int cf_internalio(const volatile void __iomem
> *addr)
>   * endian on m68k/ColdFire. Bus based address ranges, like the PCI bus,
>   * are accessed little endian - so we need to byte swap those.
>   */
> -#define readw readw
> +#define readw
>  static inline u16 readw(const volatile void __iomem *addr)
>  {
>      if (cf_internalio(addr))
> @@ -70,7 +70,7 @@ static inline u16 readw(const volatile void __iomem
> *addr)
>      return swab16(__raw_readw(addr));
>  }
>
> -#define readl readl
> +#define readl
>  static inline u32 readl(const volatile void __iomem *addr)
>  {
>      if (cf_internalio(addr))
> @@ -78,7 +78,7 @@ static inline u32 readl(const volatile void __iomem
> *addr)
>      return swab32(__raw_readl(addr));
>  }
>
> -#define writew writew
> +#define writew
>  static inline void writew(u16 value, volatile void __iomem *addr)
>  {
>      if (cf_internalio(addr))
> @@ -87,7 +87,7 @@ static inline void writew(u16 value, volatile void
> __iomem *addr)
>          __raw_writew(swab16(value), addr);
>  }
>
> -#define writel writel
> +#define writel
>  static inline void writel(u32 value, volatile void __iomem *addr)
>  {
>      if (cf_internalio(addr))
