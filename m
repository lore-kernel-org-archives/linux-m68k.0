From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Platform code merge for 68000 core cpus (part2)
Date: Wed, 5 Dec 2012 13:44:56 +1000
Message-ID: <50BEC338.30601@snapgear.com>
References: <1354662289-24601-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:30580 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753233Ab2LEDtR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Dec 2012 22:49:17 -0500
In-Reply-To: <1354662289-24601-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 05/12/12 09:04, Luis Alves wrote:
> I'm sending the patch for the 68000 core code merge to add in the 'for-next' branch.

Looks good, thanks. Added to the m68knommu for-next branch.

Regards
Greg


> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> ---
>   arch/m68k/Makefile                                 |    6 +-
>   arch/m68k/platform/68000/Makefile                  |   18 ++
>   .../{68VZ328/bootlogo.h => 68000/bootlogo-vz.h}    |    0
>   arch/m68k/platform/{68328 => 68000}/bootlogo.h     |    0
>   arch/m68k/platform/{68328 => 68000}/entry.S        |    0
>   arch/m68k/platform/68000/head.S                    |  240 ++++++++++++++++++++
>   arch/m68k/platform/{68328 => 68000}/ints.c         |    2 +-
>   .../platform/{68328/config.c => 68000/m68328.c}    |    2 +-
>   .../{68EZ328/config.c => 68000/m68EZ328.c}         |    2 +-
>   .../{68VZ328/config.c => 68000/m68VZ328.c}         |    4 +-
>   arch/m68k/platform/{68328 => 68000}/romvec.S       |    2 +-
>   arch/m68k/platform/{68328 => 68000}/timers.c       |    2 +-
>   arch/m68k/platform/68328/Makefile                  |   21 --
>   arch/m68k/platform/68328/head-de2.S                |  128 -----------
>   arch/m68k/platform/68328/head-pilot.S              |  207 -----------------
>   arch/m68k/platform/68328/head-ram.S                |  141 ------------
>   arch/m68k/platform/68328/head-rom.S                |  105 ---------
>   arch/m68k/platform/68EZ328/Makefile                |    5 -
>   arch/m68k/platform/68VZ328/Makefile                |    5 -
>   19 files changed, 267 insertions(+), 623 deletions(-)
>   create mode 100644 arch/m68k/platform/68000/Makefile
>   rename arch/m68k/platform/{68VZ328/bootlogo.h => 68000/bootlogo-vz.h} (100%)
>   rename arch/m68k/platform/{68328 => 68000}/bootlogo.h (100%)
>   rename arch/m68k/platform/{68328 => 68000}/entry.S (100%)
>   create mode 100644 arch/m68k/platform/68000/head.S
>   rename arch/m68k/platform/{68328 => 68000}/ints.c (98%)
>   rename arch/m68k/platform/{68328/config.c => 68000/m68328.c} (97%)
>   rename arch/m68k/platform/{68EZ328/config.c => 68000/m68EZ328.c} (97%)
>   rename arch/m68k/platform/{68VZ328/config.c => 68000/m68VZ328.c} (98%)
>   rename arch/m68k/platform/{68328 => 68000}/romvec.S (94%)
>   rename arch/m68k/platform/{68328 => 68000}/timers.c (98%)
>   delete mode 100644 arch/m68k/platform/68328/Makefile
>   delete mode 100644 arch/m68k/platform/68328/head-de2.S
>   delete mode 100644 arch/m68k/platform/68328/head-pilot.S
>   delete mode 100644 arch/m68k/platform/68328/head-ram.S
>   delete mode 100644 arch/m68k/platform/68328/head-rom.S
>   delete mode 100644 arch/m68k/platform/68EZ328/Makefile
>   delete mode 100644 arch/m68k/platform/68VZ328/Makefile
>
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
