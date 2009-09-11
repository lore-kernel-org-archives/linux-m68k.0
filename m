From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: bogl: don't know screen type 1
Date: Fri, 11 Sep 2009 22:25:45 +0200
Message-ID: <10f740e80909111325s62c90736p181fd349b48fccc8@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <20090831120617.GA1114@marenka.net>
	 <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com>
	 <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
	 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
	 <20090901151747.GB27514@marenka.net>
	 <8259f0250909021816g2b6a37dfs9bd91c4cabaf457a@mail.gmail.com>
	 <8259f0250909021822k70b1a152sce6ecc651334800@mail.gmail.com>
	 <alpine.LNX.2.01.0909112137580.2168@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f184.google.com ([209.85.222.184]:37588 "EHLO
	mail-pz0-f184.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751201AbZIKUZo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Sep 2009 16:25:44 -0400
Received: by pzk14 with SMTP id 14so1157380pzk.1
        for <linux-m68k@vger.kernel.org>; Fri, 11 Sep 2009 13:25:47 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.01.0909112137580.2168@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: mike <localgost@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian-68k@lists.debian.org

2009/9/11 Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no>:
> On Thu, 3 Sep 2009, mike wrote:
>> I tried to boot 2.6.29 or whatever... It was so slow compared to 2.4=
 i
>> donno what to say, except its crap. Not a surprise if gcc produces
>> crappier and crappier 68k binaries anyway. Why the hell isnt freesca=
le
>> on top of this? Fuck damn they should be on top of this and the 6805=
0/70
>> the natami is trying out, and bloody include talent like Carl S and =
Dave
>> H that know what the heck the 68k, electronics, and the amiga is
>> about....
>
> For what it's worth - my m68k systems runs current linux kernel, 2.6.=
30,
> compiled with gcc 4.2.4 just fine, and I have not see any slow-down, =
apart
> from obvious things in bootup, like initiating udev, creating nodes a=
nd
> similar things that have nothing to do with kernel itself. I also mak=
e
> sure to compile my kernels with only the modules that makes sense for=
 the
> hardware I run it on.
>
> My systems are one A1200 with Blizzard 1230III (030+882@50MHz) and 32=
MB
> RAM, one A1200 with Blizzard 1260 (060@50MHz) and 64MB RAM, and one M=
ac
> Quadra 910 (040@25MHz) with 64MB RAM. Oh and my build box, Aranym wit=
h a
> 040@100-180MHz depending on host at bootup, and for the time being, 2=
56MB
> RAM (allthough, it is down ATM, fixing filesystem disaster after I so=
mehow
> managed to launch aranym twice on same disk image :P)

[...]

> So, in the end, I'm not so sure that what you complain about is for r=
eal.

2.6.x is noticable slower than 2.4.x, due to increasing RAM requirement=
s.
Probably you don't notice it that much as even your least machine has 3=
2 MiB of
RAM. I do, as my A4000/040 has only 12 MiB of Fast RAM.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
