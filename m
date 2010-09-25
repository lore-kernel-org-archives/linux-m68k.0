From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [RFT PATCH] amiga, atari floppy: Use one request queue per disk
Date: Sat, 25 Sep 2010 11:18:05 +0200
Message-ID: <AANLkTiki5-2x2PDrsbEHYQGPDUix4ChyXiSpzt0YFy56@mail.gmail.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
	<20100923223530.GA5658@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20100923223530.GA5658@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org

Hi,

you seem to have dropped the patches from the resent mail - please
resend the patches in question to linux-m68k.

Last time I checked ataflop (around a year ago) it was still working.
I will give your patch a bit of testing once I'm back from traveling
overseas.

Cheers,

  Michael

On Fri, Sep 24, 2010 at 12:35 AM, Vivek Goyal <vgoyal@redhat.com> wrote=
:
> On Thu, Sep 23, 2010 at 03:54:04PM -0400, Vivek Goyal wrote:
>>
>> Hi,
>>
>> We seem to have deprecated the notion of sharing request queue acros=
s gendisks. Now we need to instanciate one request queue per disk.
>>
>> There see to be still some drivers sharing request queue across disk=
s. Arch
>> specific floppy drivers like amiga and atari are doing so.
>>
>> These are two patches which should fix the issue. But these patches =
are
>> completely untested. Not even compilte tested. Don't have hardware t=
o test
>> them.
>>
>> Would be great if somebody who has the hardware can lend a hand here=
 to
>> see if these patches work.
>
> Sending this mail to linux-m68k@lists.linux-m68k.org list, incase som=
ebody
> can help there with testing.
>
> Vivek
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
