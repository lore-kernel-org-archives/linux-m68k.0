From: "Gavin Lambert" <gavinl@compacsort.com>
Subject: RE: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy()
	implementation
Date: Thu, 26 May 2011 19:28:41 +1200
Message-ID: <08eb01cc1b76$89d0dfc0$9d729f40$@com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>	<1303345491-27888-2-git-send-email-gerg@snapgear.com>	<1303345491-27888-3-git-send-email-gerg@snapgear.com>	<1303345491-27888-4-git-send-email-gerg@snapgear.com>	<1303345491-27888-5-git-send-email-gerg@snapgear.com>	<1303345491-27888-6-git-send-email-gerg@snapgear.com>	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>	<m2sjs542hh.fsf@igel.home>	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>	<m3wrhgwmid.fsf@linux-m68k.org>
	<4DDDF1F9.8050902@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <4DDDF1F9.8050902@snapgear.com>
Content-Language: en-nz
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: 'uClinux development list' <uclinux-dev@uclinux.org>, 'Andreas Schwab' <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, 'Greg Ungerer' <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Quoth Greg Ungerer:
> On 24/05/11 18:06, Andreas Schwab wrote:
> > Geert Uytterhoeven<geert@linux-m68k.org>  writes:
> >
> >> What exactly do you mean by "does not support anything less"? It
> >> seems it does restrict instruction generation to 68000 if you 
> >> ask for it.
> >
> > The point is that Linux/m68k requires 68020+, so compiling for 68000
> > does not make sense (at least back when the gcc configuration was
> > created).
> 
> Yeah, used to be true :-)
> This seems very much to me to be a "broken compiler" issue.

Hmm, that has me worried a little.  I was thinking about trying to use gcc
for a (non-Linux) M68000 device.

Does the above mean that this would be problematic?


_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
