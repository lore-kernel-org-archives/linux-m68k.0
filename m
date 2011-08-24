From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: patch "TTY: remove tty_locked" added to tty tree
Date: Wed, 24 Aug 2011 23:48:22 +0200
Message-ID: <4E5571A6.6050705__4368.96635587818$1314222534$gmane$org@suse.cz>
References: <13141210141189@kroah.org> <201108241320.47635.arnd@arndb.de> <4E54E4D9.6070802@suse.cz> <201108241635.13502.arnd@arndb.de> <4E556CB7.2010102@suse.cz> <20110824214201.GB30829@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110824214201.GB30829@suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, alan@linux.intel.com, Linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

On 08/24/2011 11:42 PM, Greg KH wrote:
> So, is your original patch you sent in this thread still needed?

If you mean "TTY: remove tty_locked", then yes, it's fine to see
tty_locked go. It looks like we won't need it to fix the stalls in the
end. If you mean TTY-fix-stalls-on-BTM-when-waiting-until-sent, that one
will be superseded by a new one.

thanks,
-- 
js
suse labs
