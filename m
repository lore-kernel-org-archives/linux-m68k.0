From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Mon, 31 Jan 2011 19:41:28 +1300
Message-ID: <4D465998.60006@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de> <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de> <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com> <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com> <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org> <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com> <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org> <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com> <4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com> <4D461512.8080609@gmail.com> <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:46894 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754943Ab1AaGld (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 01:41:33 -0500
Received: by pva4 with SMTP id 4so788091pva.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 22:41:33 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Finn,
> I haven't compared the log from Thorsten's kernel failure with the 
> failures I saw, but (anecdotally) my experience was the same: SLUB on m68k 
> was not usable, going back some years.
>
> The introduction of the SLUB allocator was 2.6.22, but I can't help you 
> bisect because I don't recall that it worked ever (?)
>   
Thanks for sharing that information - that does sound like quite a 
fundamental problem, and not just limited to Atari then.
> Anyway, I do recall building SLUB kernels at the time that would fail more 
> often than they booted ... maybe the old releases could offer some clues?
>   
At least they fail in a very consistent manner now. I wonder whether 
it's worth debugging this at all?

Cheers,

  Michael
