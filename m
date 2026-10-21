Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603754;
	b=iNZSYu+YS3IoZyBQP9VzBDmWuw/GVaH9I1gC3YrmcCni4W0pHyxiU9rVEwzlo/gMVQG9
	 9WCExMO1mnNzMel6eN8xu14IXU9x70D6Rt/r2jtfMMrR8L+tJVFCc8T5I+hX2yqDCX5TX
	 Z83+3mGzJQOEua094X8BJU0KsOQ9bZQ/Td17iQZHOPbBZbSiHEgnZxEU73OlfRcc6t5kW
	 raCrIVFSc53vRHfEvPqx28bcLpGx3GLWmwIMMm4qMVYc9UKoYCwJtUPVJSz+QWL+RCy/9
	 +eL4fmkfBMsAXdO6jBCeP4npNMWlYKHOGomgRcss/CHly3k5WZo3C6adFbGFD5PwzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8fpHzdX+gh875XyXE6AD/0n3UClLH8tnWs0HpJ2fjvU=;
	b=kMgeUnacXLrCThUbyRwOfUKz3jdQhVJSlR6QiLWqztNJ4QWpePqMXMaG7l6KnkJW0ml0
	 zjyK1Y1aaVJS8LPcq30beextgbss6/gAp1kWiXwkdsKUr2qC2I+K9XHzxWD/T5C1khwqK
	 l3Ge0ha1DjZpkEsZvRC9KFzeWFjZ46rx2O7edkEzRedbjXjzrH4V41hwkZ0iXGlATze2W
	 jqkWn2l0ywuuyQ/Cfyze4Olmgr5TlqUqSbgaTbOWFkOdjP3jJHT7DrKjqjaWa8CLpeCXF
	 IswWKy4m58zjXg33DZ/dQpiEpaMFMtyVBKRwWe1l84AT4AJfOe8vhR/H/AjXxMZDqjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TmpdVxoO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81547606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81547606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TmpdVxoO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso8434845e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603753; x=1793208553; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fpHzdX+gh875XyXE6AD/0n3UClLH8tnWs0HpJ2fjvU=;
        b=TmpdVxoOyDN3XiEwh7oQuxlDx/KJoA9BuGzsqtXBy1tolw2kjMV1LhPVtmLUjgYw32
         fXw4RzpiHEtIrbsBfPXU4s/tpFs/421tNEWSqbZsqebG9+CkrY5RLG9QoH1sguWicVNp
         wiIx/IVglfiUzTkLIhXxepBa2iQ8wAZcXl5jDOJfYd4HGstIEmStrbJxnpQ13CydUqTe
         IMA7MAVxYwEvWSAxZ3mMQ435kzeP1lZoYzXEj8d4s1NML4N4tJ1YWKYdTMY2yC8X4l6C
         jt8o6T2gFQ4jd2QL7rWxtMEDIjOqhKNdzmEqUZNOgZz42sCkdJ10era3fatC8MICZ1AF
         TlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603753; x=1793208553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fpHzdX+gh875XyXE6AD/0n3UClLH8tnWs0HpJ2fjvU=;
        b=1VMsXzFFdW+8MJbFvEYPcdNO1HyTujbiziBgIMoeamAvqk6GpOJU9CbBRFZprbtoG9
         no428htyaKZP+bbNv5+ugcVMIQf4yXHaV64V5z4O0udhBTU50V55aYAJ9I6PsRu58neO
         5iM8Vo+sQ/j+zFG4b5Nq+e+miWUsK1E6Di2n/kxwe6Cby3Hq7bjRZIkstjZe6HSn29JD
         EVrfJ7qrpgSKN9onaTFnSOvU4NIkmzDkUMDr46MIfls1KzUWYWNniT5NjY1Kagwvq/QG
         ZT83VtyJ0uWJxDyF3lyuXVqW7N+HuVmJPPHRW/bTxsIrUkDk7so22eW8dMtSa4Rm8tj4
         btAQ==
X-Gm-Message-State: AFq9FYIBRp6OEcjikiSGgwOKROoGvQp74PoAqnQcC2IidcnZOjslL6AA
	TWkkoeujmybMsZYbg2o6/G0Zm3IE/Pmdtg4tfDEnv0fu7zE0tksq94ubzPlEqQ==
X-Gm-Gg: AYBFou38SIAbq4BDbvkq0/TeKaHJl/h6M4MlYpzJn5IaQfPK5nl6qvPnfAUAp6/shVL
	2ETgTpbllptBCS8en6Il8nK/o3gtfsfS0lx83lR9kssvlZCNY/M0MONoUi7ecKHH0jrPv7vTstR
	0yMoiFulh44EDTRfb7T3C3j1HYA+W6HZhKz+hzWkKl4/jLHG0TtW6KR5b+1Yk9ZJewIlpKmjctz
	zjkUMgVU70eTcTaMae/pndOIh9gw82O/VKZ2HU/9ihb/y3x31jiZRKktgrKDnTJMWuDdHiv+Jqn
	PFiAmcTgBq4JZQ+f13rNpsT4CjeFj1aS4fSDjrca3YrXS+NUAtIvJ38KsgwLJFxcRT3vZwF71Ks
	pk5Md3WyJWHgcsscyP+IItlu3o+CQOzpy0hdn69vXd2I3AkwcYX1+VYFtlBz5Vo9Y3tLc5Ej2qw
	7qwVHtuoJOdOMWK/SqaHUUE/lh8XkBY3ii0879PFABizKNrV4te/3izt4iOcC80RBXvUl/KUJAG
	y3i9Vj90QMPnzNB2mJBNsjXSjjH6KAUVb14tW/H/2EhYbH/E/2j0JhMDxWFIX755UistFOuhml4
	j9ys6SOKfOdKwGMbK4B0co5ZAO0fpOMbqrpoM60=
X-Received: by 2002:a05:600c:4ecb:b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1fdd24cf6mr59281185e9.34.1792603752428;
        Wed, 21 Oct 2026 10:29:12 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b37df4sm5815105e9.6.2026.10.21.10.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:11 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 0/8] zorro: add a CS-Lab Warp 1260 MFD
Date: Wed, 21 Oct 2026 19:29:02 +0200
Message-ID: <20261021172910.134838-1-p.pisati@gmail.com>
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

pata_cswarp [1], queued for 7.4, binds the board's Zorro device for the
IDE window alone. This series puts an mfd parent on the device
instead, hands the IDE window to pata_cswarp as a cell, and uses the
mailbox for a first set of board functions, exposed as sysfs
attributes on the Zorro device:

  1-3  the mfd parent, pata_cswarp as its first cell, defconfig
  4    the dual-port RAM command channel and the board identity
  5-8  voltages and temperatures, fan duty cycle, Kickstart slot
       selection, WiFi configuration

The layout - an mfd parent in drivers/zorro/ handing cells to the
function drivers - is modelled on Geert's Zorro MFD experiments [2],
which were the inspiration for this series.

It is an RFC because I would like opinions on the shape before going
further:

- Geert, does this fit where you wanted to take the Zorro MFD work?
  Should the parent stay in drivers/zorro/, as in your experiments,
  or move to drivers/mfd/?
- Would you rather see the voltages, temperatures and fan in hwmon
  than as plain sysfs attributes?
- Writing kickslot makes the ARM reset the machine on the spot. Is a
  sysfs attribute acceptable for that?

Tested on a Warp 1260 (firmware 20.27) on top of 7.3. Every patch builds
with W=1 for m68k multi_defconfig on next-20261021, which carries
pata_cswarp [1] and its defconfig patch.

I wrote the original version of this driver myself, by hand. An LLM
coding assistant came in later: it was used to review that code
against CS-Lab's AmigaOS sources, to write several of the fixes folded
into these patches, to split the work into this series and to draft
the commit messages. I reviewed every change and tested the result on
my Warp 1260.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/commit/?id=d388f9657ad68eca31d86765d48133b9258b8983
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd

Paolo Pisati (8):
  zorro: warp mfd: add the CS-Lab Warp multifunction parent
  ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro
    device
  m68k: defconfig: enable WARP_MFD
  zorro: warp mfd: add the dual-port RAM command channel and expose the
    board identity
  zorro: warp mfd: expose the voltage and temperature sensors
  zorro: warp mfd: expose the fan duty cycle
  zorro: warp mfd: expose the Kickstart slot selection
  zorro: warp mfd: expose the WiFi configuration

 arch/m68k/configs/amiga_defconfig |   1 +
 arch/m68k/configs/multi_defconfig |   1 +
 drivers/ata/Kconfig               |   2 +-
 drivers/ata/pata_cswarp.c         |  48 ++-
 drivers/zorro/Kconfig             |  31 ++
 drivers/zorro/Makefile            |   2 +
 drivers/zorro/warp-mfd.c          | 601 ++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h          | 170 +++++++++
 8 files changed, 828 insertions(+), 28 deletions(-)
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h


base-commit: 9a482184d910775cf648863148944945b74e2815
-- 
2.43.0

