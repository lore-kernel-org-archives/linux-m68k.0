From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 6/11] Atari: new EtherNEC driver (ne.c)
Date: Wed, 6 Jun 2012 10:29:41 +0200
Message-ID: <CAOmrzkKQZi1M3Jh4MRW82qhboQqUZWwPTApT=je22Oe+-gaLLQ@mail.gmail.com>
References: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVSJ0etRcKUZTPKh_mq8Lz-GK+Ys5QWfq3e9BrsNoN=cA@mail.gmail.com>
	<CAOmrzkJiEe_hd6BJKU-aWv7HU3EH7L-OWzi++2z0arcadAppKw@mail.gmail.com>
	<CAMuHMdV0GudNYRvnDXj74KLoFtH4pkcAn93ufc-TCJhXqAno5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42655 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755034Ab2FFI3m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:29:42 -0400
Received: by dady13 with SMTP id y13so8473538dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:29:41 -0700 (PDT)
In-Reply-To: <CAMuHMdV0GudNYRvnDXj74KLoFtH4pkcAn93ufc-TCJhXqAno5g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

>> Can't we force NE2000 to be enabled whenever ATARI_ETHERNEC is enabled
>> by default? We would not want one without the other usually.
>
> You can do a select NE2000 in the ETHERNEC part. But than ETHERNEC cannot
> be boolean and must stay tristate. That may bypass other dependencies of NE2000,
> though (e.g. NET).

True - maybe a comment to also enable NE2000 in the net section is
enough to make it obvious then.

Cheers,

  Michael
