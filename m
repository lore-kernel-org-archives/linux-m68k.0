From: "David D. Kilzer" <ddkilzer@kilzer.net>
Subject: Re: [PATCH 8/13] fbdev: mac_var_to_mode() fix
Date: Tue, 3 Nov 2009 09:00:44 -0800 (PST)
Message-ID: <282725.7401.qm@web110813.mail.gq1.yahoo.com>
References: <alpine.OSX.2.00.0911031449170.483@silk.local>
Reply-To: "David D. Kilzer" <ddkilzer@kilzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from web110813.mail.gq1.yahoo.com ([67.195.13.236]:25718 "HELO
	web110813.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751864AbZKCRHU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Nov 2009 12:07:20 -0500
In-Reply-To: <alpine.OSX.2.00.0911031449170.483@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-m68k@vger.kernel.org

On Tue, November 3, 2009 at 5:43:16 AM, Finn Thain wrote:

>      /* 800x600 */
> +    { VMODE_800_600_56, &mac_modedb[2] },
> +    { VMODE_800_600_60, &mac_modedb[3] },
>      { VMODE_800_600_75, &mac_modedb[5] },
>      { VMODE_800_600_72, &mac_modedb[4] },
> -    { VMODE_800_600_60, &mac_modedb[3] },
> -    { VMODE_800_600_56, &mac_modedb[2] },


I believe you want to swap VMODE_800_600_75 and VMODE_800_600_72 here as well.

Dave
