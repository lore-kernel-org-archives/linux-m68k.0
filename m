Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415059;
	b=iwC6weee+Z+V6Hlu9quP0unRpJ/QS5fREQgUl7FvRF7qztLb5y41GkSmsKWhipBUJR5j
	 TWjy4Sh35I4CSb20XCKd7drRHjBmY+8e47Zxsd8DuGSBXwVEXC1pAvYQrkgOmdAuPDgqP
	 gd7YRpOhJIuknWQvgy5HIB9o7tGX/P8Nmevl3bzg6aRnY/AzXoo281aPePEt6SYWMf5N0
	 uk1jln3tsAs7nPNclG8VJqrNaM5Sy9vjRdFYv8KYXHrNoPsjKiUbx4hgQCpMlFV5swRG2
	 /ROaw7u+tDKcklZJMZCWGOUZFkwePOc110f/D8IdtL8takMGZAMVVMhVli2TkNq29Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
	b=Uz5U5kE37bEwTKDJlgmhBr2udK4MrqhNtAtnXngqWF70yJTiRPEowI3fHWMXFeclMdPn
	 W6etDo0cZoiIvyvbVOTaSiqheR/0ZrQkt4sfM6w0ORhG80YUVo2uwpuzd+jvrVqApLYh+
	 NaTxPBPmEDDkx16k/vtfduxFgRp0Y2J2PtZrV9isHKADTJHqeSOoyOUOldBsbk/n+eQZg
	 YLBV+E5Tp6u/44b7z0AjAUqTAutdrVlqQH+J17Ks6EBGTF2jqtEppjOgfT7Fi++7bUo0V
	 Jkb19tomfogHpKBszbuOaK/CStrsm0PfIuhysnOPR1hiohBWpPwntGzw47bkpHD4Xkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYH1WQKg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB0606A31C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYH1WQKg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso35729755e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415057; x=1795019857; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
        b=wYH1WQKgyOyZnc/Va9gnR/BRK/cmqQIWqhBXQXizVMmdTnfkyLrcZyMU5DYmNmJJsv
         PN+qIQF1j8I/8+VMNOG3EhDkal3yhWP2i11CxEWJt4H9Iq2FVdBwzc2tm9XTJCxUHQgJ
         nvNpj0lLfgD0D8AEBRKsDCHZRbiLuZG9EOqoptb9Xb/Y0pU+YsSqY2gz1hhskCnI171y
         k2j7oqsCSTwadQDhEzUAlLxqubUDmG9jfi8R+U9IzORNqUfgKyy1sCp08YuqtWnzCZNJ
         iReXT+ZGb3ZaC3D/ri2xZZQ+q3GefRuqzEhB722GbBfhsXAi2l3TgheXiijKfyXicj+t
         2lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415057; x=1795019857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
        b=sIWoUllF+5Id9gvZl9uUEkAODCN5z9CsMKGNwXXMGatmrQyssk78heIiLoPqVLxe7k
         ktGoT0w6STXwNVolxh/qUXORnpAKbUeuQyAYe9rL7CDvMlPVnphBhvCi8LdSDlYAdhAn
         r3spSJmUEfdhqczDjzf/PfwTCPutfpsAQRUaZyhpwYn7ALOfv08wwSl2mWDTi1F1jJML
         mli8JCGqs0CyieFvShRoqXeeVislUSOZjN9HE0zJgdKMUTcIcnHw7Q2MN8HALQjn+zB1
         NYsiPjtnB89NgZadhBwP8CsL7PYSAYCYQ7tdtIgqQLrUmuepmetVoIWGEyIO3ZfMqKjM
         WZyA==
X-Gm-Message-State: APuU4Z+2nYBIks3WiHNgXph+a4KjPzBGxU6Rkny1T3/uLej5wNSebc6r
	0bXkN0mnosl2QcSryPPCx8SgDah98YVIBRSEaaP4IPr3O7y2Zddz0yDX
X-Gm-Gg: AYBFou3NjoXHZqVRu+j5KGVQb1smkjF06YouuWOJ30Q6h3S6XDAepnDKditfdZwZZ18
	ypgTsNLwFuWMjmODkqStzlEYbQXfng/qn6Erd6iVRakDZbJewobPO/F3lVzdSlDBwJY7S7Ztm9p
	UKk7uJki7Yppx0hWBUvEru2MLZoYpqWEMR+dU3hWc2nxSkONM2ILpeYZAYIgcPpGh0j2wh+A+Ls
	JjJvXygTe4+HdvEsTLqrqOiY5EmskCh9faUjQMrrP0v8nTV4R3zu2Lulh+TeovpM+Y+v1YnESb8
	t8XWS/lGabcz2iVkx9Gh7MhMlUU67QhSjo5k6nWSV6Aa02jygLjSS9VdxKZzFUFyNBvcYMU6v7D
	U81MLvjeNtnt6GnpK6L614L/qmUC2Y7PnH51AUpd/zIOc9513uTAAjPpEaaMdiJ+riSMYsmvvX0
	Ua9Z40nqiwBwlyjwA394562vvVSa1RFTDUuqFlFG/ZmGHfeAccD79SfBjRZwFaunGXBghU1uyI+
	p4vvmtdvvFa9G4jL8EcvKH2HY7BFd2vnS6Wlc3zE6FglwhUXKRocJuPfGE60CUZVWPNBZiK61OI
	guCGZErmqlC5bM6SWP2cqKcIRHsMig6n3pSSXKQNXebngJ/+S6KecoPQSo835H832Wcg3SHJkQE
	dXg4rk0ZTKaVjLdrnBslCqbcFDvIHip+1ggo=
X-Received: by 2002:a05:600c:3b01:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba09344911mr53668455e9.1.1794415056383;
        Wed, 11 Nov 2026 08:37:36 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm9925377f8f.21.2026.11.11.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:35 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/7] zorro: add a CS-Lab Warp 1260 MFD
Date: Wed, 11 Nov 2026 17:37:27 +0100
Message-ID: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS-Lab Warp 1260 is an A1200 trapdoor multifunction accelerator: it
contains a 68060, an FPGA, an ARM co-processor and several sub-devices
hanging off them. The 68k drives the IDE interface and the RTG display
controller directly, through the FPGA; the ARM owns most of the rest -
USB, SD card, WiFi, audio, the Kickstart slots, the CPU clock, fan
control and the board telemetry - and the 68k reaches it through a
dual-port RAM mailbox.

pata_cswarp, merged in 7.4-rc1, binds the board's Zorro device for the
IDE window alone. This series puts an mfd parent on the device
instead, hands the IDE window to pata_cswarp as a cell, and uses the
mailbox for a first set of board functions, exposed as sysfs
attributes on the Zorro device:

  1-3  the mfd parent, pata_cswarp as its first cell, defconfig
  4    the dual-port RAM command channel and the board identity
  5-7  voltages and temperatures, fan duty cycle, Kickstart slot
       selection

The layout - an mfd parent in drivers/zorro/ handing cells to the
function drivers - is modelled on Geert's Zorro MFD experiments [1],
which were the inspiration for this series.

The RFC [2] got no replies, so its questions still stand:

- Geert, does this fit where you wanted to take the Zorro MFD work?
  Should the parent stay in drivers/zorro/, as in your experiments,
  or move to drivers/mfd/? Lee, I have Cc'd you for this one.
- Would you rather see the voltages, temperatures and fan in hwmon
  than as plain sysfs attributes?
- Writing kickslot makes the ARM reset the machine on the spot. Is a
  sysfs attribute acceptable for that?

Changes since the RFC:
- Rebased on v7.4-rc2, which has pata_cswarp and its defconfig patch.
- Dropped the WiFi configuration patch. The board commits the SSID and
  the passphrase together when the passphrase arrives, so writing the
  passphrase alone clears the SSID: two independent attributes cannot
  express that.
- Documented the attributes in
  Documentation/ABI/testing/sysfs-driver-warp-mfd and added a
  MAINTAINERS entry.
- Created the attributes through .driver.dev_groups.
- pata_cswarp: mapped the cell with devm_ioremap_resource().
- The store callback takes a size_t count, the driver includes what it
  uses, and the probe banner prints the board window with %pR.

Tested on a Warp 1260 (firmware 20.27) on top of v7.4-rc2. Every patch
builds warp-mfd and pata_cswarp with W=1 for m68k.

I wrote the original version of this driver myself, by hand. An LLM
coding assistant came in later: it was used to review that code
against CS-Lab's AmigaOS sources, to write several of the fixes folded
into these patches and the ABI documentation, to split the work into
this series and to draft the commit messages. I reviewed every change
and tested the result on my Warp 1260.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd
[2] https://lore.kernel.org/r/20261021172910.134838-1-p.pisati@gmail.com

Paolo Pisati (7):
  zorro: warp mfd: add the CS-Lab Warp multifunction parent
  ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro
    device
  m68k: defconfig: enable WARP_MFD
  zorro: warp mfd: add the dual-port RAM command channel and expose the
    board identity
  zorro: warp mfd: expose the voltage and temperature sensors
  zorro: warp mfd: expose the fan duty cycle
  zorro: warp mfd: expose the Kickstart slot selection

 .../ABI/testing/sysfs-driver-warp-mfd         |  53 ++
 MAINTAINERS                                   |   8 +
 arch/m68k/configs/amiga_defconfig             |   1 +
 arch/m68k/configs/multi_defconfig             |   1 +
 drivers/ata/Kconfig                           |   2 +-
 drivers/ata/pata_cswarp.c                     |  48 +-
 drivers/zorro/Kconfig                         |  30 ++
 drivers/zorro/Makefile                        |   2 +
 drivers/zorro/warp-mfd.c                      | 473 ++++++++++++++++++
 drivers/zorro/warp-mfd.h                      | 148 ++++++
 10 files changed, 734 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-warp-mfd
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

