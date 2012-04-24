From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Mon, 23 Apr 2012 23:35:52 -0300
Message-ID: <CALF0-+UKvv+cebcH8s1oBpUEPguMQspV3PmjjGt6NYH-4PqS6A@mail.gmail.com>
References: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>
	<CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com>
	<CALF0-+UhCZZ+cpA88Mi1rz5QzecCxvwi6oZNNW7jmHJu7T6jsg@mail.gmail.com>
	<4F960C58.3040006@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F960C58.3040006@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, uClinux development list <uclinux-dev@uclinux.org>

Hi Greg,

2012/4/23 Greg Ungerer <gerg@snapgear.com>:
>
> Normally this signed-off-by goes after your patch description
> (Documentation/SubmittingPatches section 12).

I know. That text wasn't intended to be part of the commit message, it was
to trigger the discussion. I'll resend the patch with a proper commit message,
including the warning.

Same warning will appear on every other arch, since the only one using
flat_set_persistent() is arch/blackfin...
do you think it would be nice to submit that also (to the proper
lists, of course)?

Thanks for the review,
Ezequiel.
