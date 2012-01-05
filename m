From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: [RFC] m68k: Update defconfigs
Date: Thu, 05 Jan 2012 09:58:49 +0000
Message-ID: <4F057459.3060101@fairlite.co.uk>
References: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg> <Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org> <CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
Resent-Message-ID: <FXMUiubILnE.A.7LG.ESXBPB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

On 01/05/12 09:52, Geert Uytterhoeven wrote:
> On Wed, Jan 4, 2012 at 23:22, Thorsten Glaser <tg@mirbsd.de> wrote:
>> Geert Uytterhoeven dixit:
>>
>>>    CONFIG_SERIAL_CONSOLE                : y . . . . . . . . . . y
>> This is something I'd like to see, if it is possible from
>> the hardware: ARAnym=E2=80=99s emulated parallel port for debugging
>> is unidirectional (printing only), so, in headless mode,
>> you get no console at all (for logging in to fix the network,
>> see that it hangs in fsck, etc).
> I think ARAnyM's emulated serial port can do this, but we no longer hav=
e
> an Atari SCC driver.
>
> Finn, Michael: as pmaczilog uses platform devices, it can be made to wo=
rk
> on Atari, too?
>
>> Do the other devices not have a serial port?
> We lost all serial drivers during the last few years, except for
> amiserial (which
> we may loose in the future, too, as it does things the serial core peop=
le
> don't like / consider unsafe).
>

Yikes,

When trying to bring up the TT and getting vertical lines (which appears
to be known about given the info on the wiki with lots of TTRAM ?), I
tried to use serial console only to find that atari_scc.c is no more. :-(

It would certainly be wonderful to have atari_scc.c back.

Any other alternatives for console debugging on physical Atari ?

Alan.


--=20
To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
Archive: http://lists.debian.org/4F057459.3060101@fairlite.co.uk
