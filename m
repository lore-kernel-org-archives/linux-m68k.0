From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: Fix support for console port other than ttyS0 on mcf.c
Date: Thu, 5 Feb 2009 10:27:51 -0500
Message-ID: <20090205152751.GL26064@csclub.uwaterloo.ca>
References: <20090204201518.GH26064@csclub.uwaterloo.ca> <20090204202009.GI26064@csclub.uwaterloo.ca> <Pine.LNX.4.64.0902042200340.25136@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758091AbZBEP2W@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0902042200340.25136@anakin>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org, uClinux list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, Feb 04, 2009 at 10:00:58PM +0100, Geert Uytterhoeven wrote:
> On Wed, 4 Feb 2009, Lennart Sorensen wrote:
> > Perhaps CCing linux-m68k@lists.linux-m68k.org would be a good idea.
> 
> Thanks, but this is a uClinux driver.

This is a patch against Linus's current tree.  How is that a uClinux
driver?  I am using a build of yesterday's git tree from Linus on a
5271evb board and this fixes the console port with it.  I have no user
space yet, so whatever does uClinux have to do with anything?

-- 
Len Sorensen
