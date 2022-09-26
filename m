Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4CCC07E9D
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 21:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiIZVhv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 17:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiIZVht (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 17:37:49 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3E8A4B22
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:37:48 -0700 (PDT)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8hR1-1oYmvt1jMH-004i6J; Mon, 26 Sep 2022 23:37:40 +0200
Message-ID: <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
Date:   Mon, 26 Sep 2022 23:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Content-Language: fr
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
From:   Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220926113900.1256630-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6DTZTMx+opRdoNlKnbs0jC9+6sR6ArUyXjpDiGrNrOgTMS378PQ
 pX0rpA/RHF9ytqfaqyIj67EmKc8NYMF5gI6TlNpTEUL50DybvSvSSwpeyqRKn3HoC222DqX
 Sf/ZwqS31+covgg+AC0JasYtseY+qhgzMNHEVx/3SvZjpZ5ZDbkK22i9Xst2gwPkNHG4UB8
 qtFXs5PmpBUBf4svh9MRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hR88Fh3fgGg=:kh2mc0tJpJPfFQEkUwu+Bq
 O/4oyAwfYmKdM2FokarPMz46zXiDxNkx2SD425jZbHrZSy3fjhZwBRKPRaXC+fQNBZM8Irgiu
 Mo5XBYb++nNhxU5XYN6r5zXMWiIOVvvCR3pdQOXqQKjBVol6DXkyHrZxkAME9dGQIm1DHEish
 LKfr381eKEFc5VxKIBTNSr7ZUXDorIFve9Va1kAEZofQCHLJNIpDS/i/FWyKkQ98d01qbpI5A
 vtqmBeBgRWyyiXebR3RhnINmAdIu5N+SrN00hoJShHo3+s0pCB0PSxY/NcZaJqw5N4HfPoc6B
 0FVm3VAyqHLEGhlSCQRc1DlOYLcMKcU/IEVbpXx8QXzpNwVUYbQlzmAJGpjQNU5YVmbty7blY
 F0ev0ilrFLvSrwrdfGH6eH5BgSK3cvV/vjPu45dfNsqNjnCC5wNsLA6lJyhtf9p+4nKnH39ZY
 w0zCgc17GGNDMFzzVvjQ9sYGLT/i1fDwwnZbf1HeoZTWuRWxsb+VzKZVfA99uHpTYjiUQvKmz
 Gf55CeLHwjwPVjoKeHpesT2q8uLk4RVd+1lm0sKzLOfVYC8DmdDXCLb6I+HRgIx465ZTGvwyM
 6ErKEknCghAM08kXO6lIuQFYO1/La54MmGaC2wGj8dMKJmO/5mCYgwwSVTtOQmuGw7ACpTu0v
 1EUuMLlSdAHKOT423JodRDTG5VSrTlzWK0UJ0OPt1+piBd7FweAlr9NO16z68my/n720uY0w1
 z3LB5y/+OCWLDr0WuRsDJ8fLdRIuuqneZ8AApTwRkL1RKhURp3aWFzpgtIBu/ulU/kEq0b0BB
 slngb1l
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> padding to fill this out as such.
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

Applied to my m68k-for-7.2 branch

Thanks,
Laurent


