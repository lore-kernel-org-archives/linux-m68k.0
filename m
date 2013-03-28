From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 11:40:02 +1300
Message-ID: <5154C6C2.1070905@gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org> <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org> <51515889.6040106@uter.be> <5152996E.50800@gmail.com> <CAMuHMdX1A_hc4UgeOyJBaGY-AFfH09wjtoQV-pKg5GLXidAJGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:52175 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607Ab3C1WkI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Mar 2013 18:40:08 -0400
Received: by mail-pb0-f45.google.com with SMTP id ro8so12273pbb.32
        for <linux-m68k@vger.kernel.org>; Thu, 28 Mar 2013 15:40:08 -0700 (PDT)
In-Reply-To: <CAMuHMdX1A_hc4UgeOyJBaGY-AFfH09wjtoQV-pKg5GLXidAJGA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, =?UTF-8?B?SW5nbyBKw7xyZ2Vuc21hbm4=?= <ij@2012.bluespice.org>

Geert,
> patches for now - the changes
> to the ISP116x driver are far too intrusive for my taste.
> OK. Do you want me to skip these as well?

Only for upstream submission - I would prefer having all of them in 
m68k-queue (for things like building kernel packages for unreleased).
>> Geert: only patches touching code outside arch/m68k have to go to
>> linux-netdev?
> Indeed.

OK. Let's hope Paul has no further objections then.

> And the USB changes have to go to  linux-usb@vger.kernel.org instead ;-)

Of course.

Cheers,

     Michael
