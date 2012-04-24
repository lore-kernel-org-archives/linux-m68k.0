From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Tue, 24 Apr 2012 13:10:57 +1000
Message-ID: <4F9619C1.4050802@snapgear.com>
References: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>	<CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com>	<CALF0-+UhCZZ+cpA88Mi1rz5QzecCxvwi6oZNNW7jmHJu7T6jsg@mail.gmail.com>	<4F960C58.3040006@snapgear.com> <CALF0-+UKvv+cebcH8s1oBpUEPguMQspV3PmjjGt6NYH-4PqS6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CALF0-+UKvv+cebcH8s1oBpUEPguMQspV3PmjjGt6NYH-4PqS6A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, uClinux development list <uclinux-dev@uclinux.org>

Hi Ezequiel,

On 24/04/12 12:35, Ezequiel Garc=EDa wrote:
> 2012/4/23 Greg Ungerer<gerg@snapgear.com>:
>>
>> Normally this signed-off-by goes after your patch description
>> (Documentation/SubmittingPatches section 12).
>
> I know. That text wasn't intended to be part of the commit message, i=
t was
> to trigger the discussion. I'll resend the patch with a proper commit=
 message,
> including the warning.

Ok, sorry, I thought that was supposed to be the commit message.


> Same warning will appear on every other arch, since the only one usin=
g
> flat_set_persistent() is arch/blackfin...
> do you think it would be nice to submit that also (to the proper
> lists, of course)?

Yes, I think that is a good idea.

Regards
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
