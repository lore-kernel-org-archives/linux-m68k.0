From: Paul Bolle <pebolle@tiscali.nl>
Subject: m68k: five unused boards in Kconfig.machine
Date: Thu, 21 Mar 2013 13:17:38 +0100
Message-ID: <1363868258.1390.129.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org

0) These five Kconfig entries in arch/m68k/Kconfig.machine are entirely
unused:
    config UC5272
    config UC5282
    config SOM5282EM
    config COBRA5329
    config SNAPGEAR

1) I think that these can be removed. But I recall from an earlier
thread (in 2011) that Greg wanted to keep SOM5282EM:
    Although it isn't used inside the code it does let the configurer
    know that this specific board is supported.

2) Would it be acceptable to remove these five Kconfig entries but add
text to the prompts or the help strings of some other entries to
indicate support?


Paul Bolle
