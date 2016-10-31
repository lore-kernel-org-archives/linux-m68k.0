From: Angelo Dureghello <angelo@sysam.it>
Subject: [RFC] m68k: network interface on amcore board
Date: Mon, 31 Oct 2016 08:26:21 +0100
Message-ID: <1e301293-ea8d-5cf3-9561-336b634659ea@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:35845 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758748AbcJaH0Z (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 31 Oct 2016 03:26:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

i have still a last issue open on mcf5307-based "amcore"
board i would like to fix, and need a suggestion:

at design time, i wired the 32bit parallel data bus from cpu to
the ethernet chip as "straight" (D0 to D0, ... D32 to D32).

dm9000 driver btw works for little-endian cpu only. To have it
working, i actually keep a byte "swap" patch in the driver.

Since i guess i cannot pretend any driver patch for this case,
i am planning a new pcb version with 32bit data bus bytes swapped
in hardware.

What do you think ?

Thanks,

Best regards,
Angelo Dureghello
