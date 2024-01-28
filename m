Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1D1EB22
	for <linux-m68k@vger.kernel.org>; Sun, 28 Jan 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706437249; cv=none; b=g42Brf5OLqxx9Iz33fSsRhLE95Me5ldqb3970LsXT3A5Ei/4z3HFUqkpVRlwtHGX1LWb9/5YnsyTLNHVWUo3FQ8OX3gD8xDzRGaYg3XGu/xtuV4oy/6QY0pitGFBTts4bUE5CXl46D2AOIEMt9Dl/gCS2lhFqFr2l5T7QAkjn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706437249; c=relaxed/simple;
	bh=is4HbxsUr3AZqTf5FMdJUZvd/6nJY7IBbKqWufkGY2k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=LB7+pDP6sNyJICC1BfudCP6/45wi74n1/jPE5cHsxyuWynWWsZzEgVDg9aeX0PChYa5lEL5QDccpT8coscWtFn9T2rfwcSH2rQKbw0JztW/F3KH9fU6fTXGui9sutTlq6U5Bq2D7/C7xjnzjcdexToe25R0Tmps/yjrMpOaAiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=none smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b=zZtAglif; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b="zZtAglif"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbbc6bcc78so1739893b6e.1
        for <linux-m68k@vger.kernel.org>; Sun, 28 Jan 2024 02:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1706437247; x=1707042047; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETx8KXuNp/J85XIzEUyNHHfqjDsw3dfBnNYZ/3vNj10=;
        b=zZtAglifD0ETD2y4WBivP558+aIjiKKxD2I/iDkSLCHJY3/yIpgz9s1z9/vH0q44GG
         4GHLkKa7fYMLxJnmZru+eKpdyQZs7bglKZhb3XXBgSbR3ccYsfQdN0grag298NnT23lk
         rKTgw/EaDYLBg3/CpYPJ7BZHqMjOYr/UVrFqvPNX0vKrKBh3B8+AQg4QprnFVJhUTH2U
         GO9nuQK/46XT9w0O8G1L7sM359XLg8tronjbRzAxxrDPL06CNzlbDoQ1lFIqw7K/xwDM
         yOSFeasz/s+4/AAQmYJuRmLG5A2AbZ19owc4jd40vA/UWoStkx1el+mIqmwR6wijOwuT
         P65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706437247; x=1707042047;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETx8KXuNp/J85XIzEUyNHHfqjDsw3dfBnNYZ/3vNj10=;
        b=AWO+KF+rE6rBcznShs+JI1fLYxqrRr2GBn6eoJvD3x6JXo3F4uZvXvBPtYAFd38k9u
         9tW4O6GzgwIBRYcvGXJuw4ZxTtTlwtRm+kQZdgBTp25Q1pK2+Lm/CqgDqg3pL7D5S+Zu
         zM9KN7XIADDxRzle9I9YDcdEYGoK4ngsFpJoqHAlu8/DpD6A8Nwn9Q3su05pePdcAyEK
         1FqFUZ/qZzrfX0h+3KqfAQsbewvHkcT2AEKu9FLlfySGZMFa1dp7eBGpP5dAx3u3duIh
         g5msxC6u8syQR3h6fc5xTLS6VP/g65iRsVXjgWEZIVJe2F1kVLHH359JgAnXd8xmtLbT
         JRVA==
X-Gm-Message-State: AOJu0YwJiFMkqbQd2DsJHdwgeMDX6vHKvJ6QHuBfIf+7r0oToQTmIPXW
	HUdicKuMdoda/HdSkpgerG/t5IPBucI4AkKaRgQ+czi0PS89EfD1uLGzdX/sWlo1JFGz3CfPWn4
	3
X-Google-Smtp-Source: AGHT+IFXttHRBZVDyOsgrB7/uO/atrzEk712Iy1RGRNQRpVuosKmu6PInSmFWAGHimpp5sEAbcWqTQ==
X-Received: by 2002:a05:6808:148b:b0:3be:2e20:af9d with SMTP id e11-20020a056808148b00b003be2e20af9dmr2347093oiw.8.1706437246762;
        Sun, 28 Jan 2024 02:20:46 -0800 (PST)
Received: from [192.168.1.4] ([136.62.51.249])
        by smtp.gmail.com with ESMTPSA id l7-20020a544507000000b003bdffb48333sm833681oil.35.2024.01.28.02.20.46
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 02:20:46 -0800 (PST)
Message-ID: <18232799-792d-e5c4-5483-00e84b8bd530@landley.net>
Date: Sun, 28 Jan 2024 04:27:59 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: linux-m68k@vger.kernel.org
From: Rob Landley <rob@landley.net>
Subject: m68k fdpic toolchain?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that we can build coldfire fdpic support in the kernel, does a _compiler_ exist?

https://lore.kernel.org/linux-mm/20220428033319.239341-1-gerg@linux-m68k.org/T/

I built buildroot's mcf5208evb defconfig and booted it under qemu, but it's
binflt, which I'm not adding to my test system's package dependencies. According
to fs/Kconfig.binfmt:

 config BINFMT_ELF_FDPIC
        bool "Kernel support for FDPIC ELF binaries"
        default y if !BINFMT_ELF
        depends on ARM || ((M68K || RISCV || SUPERH || XTENSA) && !MMU)

So I can select it, but in gcc's current git "grep -irl fdpic gcc/config" only
has hits in the sh, arm, frv, and bfin directories.

Two of those three (frv and blackfin) were jettisoned by linux-kernel due to
loss of expertise in the development community. I've already got an sh2 fdpic
test system, but only on real hardware, not qemu (which decided to add
qemu-system-sh4 instead of qemu-system-sh way back when, and thus never
populated the rest of the family).

I'm happy to use out-of-tree patches for m68k if that's what's available, but I
haven't been able to find any. I assume that enabling fdpic means the ABI was
documented specifying the registers for the extra segments...?

Rob
