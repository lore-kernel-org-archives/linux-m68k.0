From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Thu, 2 Jun 2011 22:34:21 +1000
Message-ID: <4DE7834D.3030709@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>	<1303345491-27888-2-git-send-email-gerg@snapgear.com>	<1303345491-27888-3-git-send-email-gerg@snapgear.com>	<1303345491-27888-4-git-send-email-gerg@snapgear.com>	<1303345491-27888-5-git-send-email-gerg@snapgear.com>	<1303345491-27888-6-git-send-email-gerg@snapgear.com>	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>	<m2sjs542hh.fsf@igel.home>	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>	<m3wrhgwmid.fsf@linux-m68k.org>	<4DDDF1F9.8050902@snapgear.com>	<BANLkTinAJPBc=Dzy8vZOhcGME55vNc49qg@mail.gmail.com>	<4DE71D3D.1080203@snapgear.com> <BANLkTima37d7L_GLEf3iwe3i_o3cSSiUfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:14861 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933477Ab1FBMgk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jun 2011 08:36:40 -0400
In-Reply-To: <BANLkTima37d7L_GLEf3iwe3i_o3cSSiUfA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


Hi Geert,

On 02/06/11 17:43, Geert Uytterhoeven wrote:
> On Thu, Jun 2, 2011 at 07:18, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 26/05/11 16:38, Geert Uytterhoeven wrote:
>>> I was more thinking along the lines of !CONFIG_M68000&&  =C3=A1!CON=
=46IG_M68010
>>> &&  =C3=A1!CONFIG_<whatever Coldfire that doesn't support it>.
>>
>> Or in this case (and probably most cases) we could just switch
>> to using the same positive logic. So what I had as:
>>
>> #if defined(__mc68020__) || defined(__mc68030__) || \
>> =C3=A1 =C3=A1defined(__mc68040__) || defined(__mc68060__) || defined=
(__mcpu32__)
>>
>> becomes
>>
>> #if defined(CONFIG_M68020) || defined(CONFIG_M68030) || \
>> =C3=A1 =C3=A1defined(CONFIG_M68040) || defined(CONFIG_M68060) || \
>> =C3=A1 =C3=A1defined(CONFIG_MCPU32)
>>
>> There currently isn't a CONFIG_MCPU32, but I could easily add
>> that (we only have one CPU in that class currently supported,
>> the 68360).
>>
>> The compiler setting won't matter, only what we configured.
>> Sam will probably like this better, he suggested using the
>> kernel configs initially, in
>> http://www.spinics.net/lists/linux-m68k/msg03609.html
>
> Pure positive logic won't work in the (currently stil pathological) c=
ase you're
> building a multi-platform kernel, and have both CONFIG_M68020 and a l=
esser
> one that doesn't support cpu32 instructions selected.

True. Though we could re-arrange the code blocks to keep the
logic positive. So for the memcpy.c case something like:

#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000) || \
     defined(CONFIG_MCPU32)
	/* the simple code */
#else
	/* the real 68020+ code */
#endif

Now the code doesn't yet have the defines CONFIG_M68000 and
CONFIG_MCPU32. But I have a patch ready to send that introduces
them :-)

Regards
Greg
