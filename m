From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Sun, 30 Mar 2014 13:01:22 +1300
Message-ID: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:57261 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbaC3ABg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Mar 2014 20:01:36 -0400
Received: by mail-pd0-f182.google.com with SMTP id y10so6449809pdj.27
        for <linux-m68k@vger.kernel.org>; Sat, 29 Mar 2014 17:01:36 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org

Geert,

see the following patch series for the hopefully final word on 
the 'make ST-RAM pool accessible for kernels running from FastRAM'
story.                    

ST-RAM pool is allocated from an arch initcall if the kernel runs 
in FastRAM, at which time memory mapping support is up and running
and ioremap works as it should. 

This should make current kernels run again on TTs with insufficent 
ST-RAM but enough TT-RAM to hold the kernel and user data. It does
speed up kernel operations a great deal on Falcon hardware with
FastRAM on accelerators. 

Side effects: rebooting from a kernel in FastRAM will go through a
hard reboot -no idea why. SCSI operations seem to fail sooner than
otherwise on my system (the SCSI patches are not in my atafb-stram
branch). Need to investigate on both accounts.

Please review and apply. 

Cheers,

        Michael
