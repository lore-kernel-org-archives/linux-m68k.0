From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Fri, 18 Feb 2011 16:24:13 +0100
Message-ID: <AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>
References: <4D5DB83D.80205@snapgear.com>
	<AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Steven King <sfking00@yahoo.com>
List-Id: linux-m68k@vger.kernel.org

On Fri, Feb 18, 2011 at 12:27, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> On Fri, Feb 18, 2011 at 01:07, Greg Ungerer <gerg@snapgear.com> wrote:
>> I would like to put up for discussion a merge of the m68knommu and
>> m68k arch branches.
>>
>> Attached is a script and patch that does a kind of brute force
>> simplistic merge of the directories and files. (Thanks to Stephen King
>> <sfking@fdwdc.com> for the initial version of this script, and to
>> Sam Ravnborg for the m68k includes merge script this was based on).
>> Nothing outside of the arch/m68k and arch/m68knommu directories is
>> touched, and in the end there is no more arch/m68knommu. To apply you
>> simply run the script from the top of a current kernel git tree (I used
>> 2.6.38-rc5 for testing) and then apply the patch.
>
> Building...

Builds fine (all test configs), runs on ARAnyM.

Let's go ahead?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
