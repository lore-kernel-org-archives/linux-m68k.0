From: Al Stone <ahs3@redhat.com>
Subject: Re: [PATCH] char: Drop bogus dependency of DEVPORT on !M68K
Date: Wed, 20 Apr 2016 13:43:10 -0600
Message-ID: <5717DBCE.2000303@redhat.com>
References: <1460364055-10174-1-git-send-email-geert@linux-m68k.org>
Reply-To: ahs3@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:36489 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbcDTTnM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2016 15:43:12 -0400
Received: by mail-ig0-f177.google.com with SMTP id f1so138069376igr.1
        for <linux-m68k@vger.kernel.org>; Wed, 20 Apr 2016 12:43:11 -0700 (PDT)
In-Reply-To: <1460364055-10174-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On 04/11/2016 02:40 AM, Geert Uytterhoeven wrote:
> According to full-history-linux commit d3794f4fa7c3edc3 ("[PATCH] M68k
> update (part 25)"), port operations are allowed on m68k if CONFIG_ISA is
> defined.
> 
> However, commit 153dcc54df826d2f ("[PATCH] mem driver: fix conditional
> on isa i/o support") accidentally changed an "||" into an "&&",
> disabling it completely on m68k. This logic was retained when
> introducing the DEVPORT symbol in commit 4f911d64e04a44c4 ("Make
> /dev/port conditional on config symbol").
> 
> Drop the bogus dependency on !M68K to fix this.
> 
> Fixes: 153dcc54df826d2f ("[PATCH] mem driver: fix conditional on isa i/o support")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/char/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index d3b8ddc6241cac2d..fa56bc757fe98fd1 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -585,7 +585,6 @@ config TELCLOCK
>  
>  config DEVPORT
>  	bool
> -	depends on !M68K
>  	depends on ISA || PCI
>  	default y
>  
> 

This solves the particular problem I was running into on an arm64 AMD Seattle
system.  Thanks!

Tested-by: Al Stone <ahs3@redhat.com>

-- 
ciao,
al
-----------------------------------
Al Stone
Software Engineer
Red Hat, Inc.
ahs3@redhat.com
-----------------------------------
