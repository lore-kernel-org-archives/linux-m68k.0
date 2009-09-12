From: fthain@telegraphics.com.au
Subject: Re: bogl: don't know screen type 1
Date: Sat, 12 Sep 2009 20:24:31 +1000 (EST)
Message-ID: <alpine.LNX.2.00.0909122011590.6056@nippy.intranet>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>  <20090831120617.GA1114@marenka.net>  <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com>  <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>  <20090901151747.GB27514@marenka.net>  <8259f0250909021816g2b6a37dfs9bd91c4cabaf457a@mail.gmail.com> <8259f0250909021822k70b1a152sce6ecc651334800@mail.gmail.com>
 <alpine.LNX.2.01.0909112137580.2168@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:42768 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752971AbZILKfE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 12 Sep 2009 06:35:04 -0400
In-Reply-To: <alpine.LNX.2.01.0909112137580.2168@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>
Cc: mike <localgost@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian-68k@lists.debian.org



On Fri, 11 Sep 2009, Kolbj?rn Barmen wrote:

> On Thu, 3 Sep 2009, mike wrote:
> 
> > I tried to boot 2.6.29 or whatever... It was so slow compared to 2.4 i 
> > donno what to say, except its crap. Not a surprise if gcc produces 
> > crappier and crappier 68k binaries anyway. Why the hell isnt freescale 
> > on top of this? Fuck damn they should be on top of this and the 
> > 68050/70 the natami is trying out, and bloody include talent like Carl 
> > S and Dave H that know what the heck the 68k, electronics, and the 
> > amiga is about....
> 
> For what it's worth - my m68k systems runs current linux kernel, 2.6.30, 
> compiled with gcc 4.2.4 just fine, and I have not see any slow-down, 
> apart from obvious things in bootup, like initiating udev, creating 
> nodes and similar things that have nothing to do with kernel itself. I 
> also make sure to compile my kernels with only the modules that makes 
> sense for the hardware I run it on.

What happened to devtmpfs I wonder.
 
> My systems are one A1200 with Blizzard 1230III (030+882@50MHz) and 32MB 
> RAM, one A1200 with Blizzard 1260 (060@50MHz) and 64MB RAM, and one Mac 
> Quadra 910 (040@25MHz) with 64MB RAM. Oh and my build box, Aranym with a 
> 040@100-180MHz depending on host at bootup, and for the time being, 
> 256MB RAM (allthough, it is down ATM, fixing filesystem disaster after I 
> somehow managed to launch aranym twice on same disk image :P)

Can't file locking prevent that? Sounds like a bug...

Finn

> 
> The A1200 with Blizz1230III has been running more or less non-stop since 
> 1997 with only a break now and then when moving between locations, being 
> installed into new tower solutions, and infrequent kernel updates,
> 
> I dont use debian though, I use gentoo since it gives me a tool 
> (portage) to build packages the way I want them, stripped where needed, 
> bloated for the things I care about. Almost everything is buildt -Os.
> 
> So, in the end, I'm not so sure that what you complain about is for 
> real.
> 
> -- kolla
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
