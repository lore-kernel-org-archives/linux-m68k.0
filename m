From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/28 v6] m68k: Convert to genirq
Date: Thu, 20 Oct 2011 18:03:28 +0200
Message-ID: <CAMuHMdW7x1_6P6UiaiHf-ynvsGjX76eZtw4PU2SvberKGD69hg@mail.gmail.com>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
	<CAMuHMdWOhKcoDoyTnKJzruZ=gpV5uKNFpXnGCkrac7oEkCihJw@mail.gmail.com>
	<alpine.LNX.2.00.1110202347320.2696@nippy.intranet>
	<CAMuHMdVMp65XzV2zu7V8sgwsniCAxD7NDDnHSvp5gO-8g1ovHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVMp65XzV2zu7V8sgwsniCAxD7NDDnHSvp5gO-8g1ovHg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, Oct 20, 2011 at 17:02, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Thu, Oct 20, 2011 at 15:40, Finn Thain <fthain@telegraphics.com.au=
> wrote:
>> Sounds good. The mac_esp fix I sent is already in linux-next.
>
> Thanks for reminding me I still have to apply that one :-)

That's e544d704f9bea6892808e453e219aa305bc0269a
("[SCSI] mac_esp: remove redundant mutual exclusion")?
And it should be applied (at least to m68k/master)_before_ the genirq
conversion, right?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
