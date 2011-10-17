From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 12/21] m68k: drop unused Kconfig symbols
Date: Mon, 17 Oct 2011 09:52:44 +0200
Message-ID: <1318837964.6414.6.camel__34545.9790355109$1318838007$gmane$org@x61.thuisdomein>
References: <1318595371.6132.70.camel@x61.thuisdomein>
	 <4E9B7BE1.1080907@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E9B7BE1.1080907@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Mon, 2011-10-17 at 10:50 +1000, Greg Ungerer wrote:
> I have no problem with the changes. But it will clash with the
> reworking of the Kconfig files currently sitting in linux-next
> for merging in the 3.2 merge window.

So should I put this on hold and see what's needed after those reworked
Kconfig files are merged in mainline? Or would you prefer to have that
done beforehand (ie, I'll try to redo this on top of current linux-next
and get the redone patch in linux-next before the 3.2 merge)?


Paul Bolle
