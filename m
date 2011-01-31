From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Mon, 31 Jan 2011 14:49:06 +1300
Message-ID: <4D461512.8080609@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>	<4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:56097 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751986Ab1AaBtK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 20:49:10 -0500
Received: by pzk35 with SMTP id 35so761759pzk.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 17:49:09 -0800 (PST)
In-Reply-To: <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,
>>
>> Whatever the reason - the SLUB allocator either is buggy outright for m68k,
>> or we run into memory pressure a lot sooner than other architectures and the
>> VM subsystem needs optimizing for SLUB.
>>
>> I'd just replace the Debian default for the m68k kernels....
>>     
>
> If switching from SLUB to SLAB fixes the problem, please enable
> CONFIG_SLUB_DEBUG and bring it up on lkml/with the SLUB people.
>   
Can do that - I'll try and collect debug data from another case I know 
has had trouble with SLUB. I'll probably have to build a custom kernel 
for them and test that on the live mail server. Fun ... :-)

Cheers,

  Michael
