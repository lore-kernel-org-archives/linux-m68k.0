From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 05/11] m68k/atari: Add missing platform check before
 registering platform devices
Date: Mon, 26 Mar 2012 07:53:50 +1300
Message-ID: <CAOmrzk+m2+GKOu+1nOJ2E1Aogx3Lj7vbUDHG5azK+A492MkDOw@mail.gmail.com>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
	<1332323515-7314-5-git-send-email-geert@linux-m68k.org>
	<4F6E950E.30809@gmail.com>
	<CAMuHMdXcJCdt+X53zrSUbpvFxL2WzuQH6MWByFvQ5E0UT2LHYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXcJCdt+X53zrSUbpvFxL2WzuQH6MWByFvQ5E0UT2LHYg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,


>> How about this instead - probe for the EtherNAT config register, and
>> register devices only if found?
>
> That's even better, but logically, it's an extra change on top, so I'=
d like
> to keep it separate.

OK, I'll resend as soon as I've pulled your latest changes.

>> + =A0 =A0if (MACH_IS_ATARI) {
>
> I prefer the "if (!MACH_IS_ATARI) return -ENODEV;" at the top, as it
> =A0- means less code to change if more platform devices are added,
> =A0- means less source code to keep on your mental stack when reading=
 the code,
> =A0- decreases indentation for the rest of the function.

OK; do you want the tests and platform calls conditional on config
options (we only need to have the platform data available if there's a
driver or module built to use it)?

Cheers,

  Michael
