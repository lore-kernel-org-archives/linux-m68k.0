Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CBF211A28
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Sep 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324754; cv=none; b=EeToAevIrbCzSJRX9a4FCSkF8f2yiLZJb/jLruNFfDL3aCp7QD4p5SO5i3Z05oET2J76TcvdF+0KEmGIfdzTkeEWKDYuv/owyCEhbLo0m6DJXeCjJIcI1A2rvrRjdccnNTROG1fZzPF4xvmM6vYpJDNFQfaGYsBJ1LGWdhbgafY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324754; c=relaxed/simple;
	bh=2tzQ2xIm9jkK5PEpR0qKT3Dtvn3u+D1CotDGqedcQkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxcht+K18M2nc6MZyFWcnr1VkPQkzKrT3vF5TSdJtQaMbJjIhij13EuT3M+FaMp8QVhUw5Wc4q52rG7Id7892VCF/8XT60tPoXBfrd5pzh0ub9k9RfrOwUgpWVW4v44MrVgJkL6/sKF+YWh0cfg/1KxxUrWZj5ta5dNv3DRCYng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F9FB601A4;
	Mon,  8 Sep 2025 09:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B5DC4CEF1;
	Mon,  8 Sep 2025 09:45:49 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Philip Blundell <philb@gnu.org>,
	Kars de Jong <jongk@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/2] tty: serial: 8250: Rework HP300 serial Kconfig logic
Date: Mon,  8 Sep 2025 11:45:40 +0200
Message-ID: <cover.1757323858.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The HP300 serial driver has a long-standing configuration issue: when
SERIAL_8250 and HP300 are enabled, but none of HPDCA and HPAPCI is
built-in:

    drivers/tty/serial/8250/8250_hp300.c:24:2: warning: #warning CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure? [-Wcpp]
       24 | #warning CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure?
	  |  ^~~~~~~

This series fixes this by reworking the Kconfig logic to make invalid
configurations impossible, after moving the HP300 serial suboptions to
where they really belong.  It is meant as a replacement for "[PATCH]
m68k: make HPDCA and HPAPCI bools" [1], and was compile-tested only.

Anyone who can test this one real hardware?
Probably we should add the following to hp300_defconfig:

    +CONFIG_SERIAL_8250=y
    +# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
    +# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
    +CONFIG_SERIAL_8250_CONSOLE=y
    +CONFIG_SERIAL_8250_HPDCA=y
    +CONFIG_SERIAL_8250_HPAPCI=y

Thanks for your comments!

[1] https://lore.kernel.org/all/20250822104208.751191-1-jirislaby@kernel.org

Geert Uytterhoeven (2):
  tty: serial: 8250: Move HP300/400 serial Kconfig options
  tty: serial: 8250: Rework HP300 serial Kconfig logic

 arch/m68k/Kconfig.devices            | 14 -------------
 drivers/tty/serial/8250/8250_hp300.c | 30 ++++++++++++----------------
 drivers/tty/serial/8250/Kconfig      | 16 ++++++++++++++-
 3 files changed, 28 insertions(+), 32 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
