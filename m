From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Platform code merge for 68000 core cpus
Date: Wed, 24 Oct 2012 16:03:47 +1000
Message-ID: <508784C3.6000707@snapgear.com>
References: <1351035923-10955-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:10418 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757482Ab2JXF6K (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Oct 2012 01:58:10 -0400
In-Reply-To: <1351035923-10955-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 24/10/12 09:45, Luis Alves wrote:
> I've fixed the previous issue.
>
> As a test I've built a kernel for the 68000 based on the git sources with this patch and everything went smooth. (Tested it in real hardware)

Thanks, this looks good, cleans up all those targets nicely.
Handy reduction in code size too. I have pushed this into the
for-next branch of the m68knommu git tree.

Regards
Greg



> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> ---
>   arch/m68k/Kconfig.cpu                              |    2 +-
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
>   20 files changed, 268 insertions(+), 624 deletions(-)
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

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
