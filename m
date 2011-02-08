From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: find_next bitops on m68k may cause out of bounds memory access
Date: Tue, 8 Feb 2011 13:55:47 +1300
Message-ID: <AANLkTi=DE3k6WB-Ee0rq3XBWfUWsWFM9jXXiodmMy_Mr@mail.gmail.com>
References: <AANLkTik00GTZDn=t6J65dHjJiU53M5vXzBqToiYWz33P@mail.gmail.com>
	<AANLkTi=LA1fmipUSycAEk48TwVXhzwbY5KMSfu=YMiCy@mail.gmail.com>
	<m2bp2nfpaf.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2bp2nfpaf.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-m68k@lists.linux-m68k.org

Thanks Andreas - there goes my theory I guess. Ralf's linux-m68k CVS
conversion tree predates 2.6.32 by quite some time.

  Michael


On Tue, Feb 8, 2011 at 11:33 AM, Andreas Schwab <schwab@linux-m68k.org>=
 wrote:
> Michael Schmitz <schmitzmic@googlemail.com> writes:
>
>> Thanks for spotting this - does anyone remember when this version of
>> find_next bitops was first introduced?
>
> c82db5b in git.kernel.org:ralf/linux-m68k.git
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756 =A001D3 44D5 214B 82=
76 4ED5
> "And now for something completely different."
>
