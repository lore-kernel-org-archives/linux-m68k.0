Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11083CE0AE
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477373; cv=pass; b=b68W+D/0AVaIjISBgxkkbr71iqpMZZwoxUB/FNj3RAyRFepHZejFe5VdCp66m+7DICguXhVirGdncwt7TUKCdWhCbSNCzJ4Fv041YOvkJg7mVtOkwOTDCNY00+vHMK8gV8kITaCnAI9e4AtY+M1lGIWbEmZte/53lPGQqWU3nAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477373; c=relaxed/simple;
	bh=RNRapNIbgEWc1qE0oAblhftV4Ixuf8iVdDHBIQcCDGM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dtMX+OjOvtqs+9JXluAqysjcWENar7g40pjxWBsKQ/StlEa3odMNLbuQCPf3zvczcP8rgfcmjNnf//fdidBq0oRRHnfKnQROq7LYQjDY8ZRqpNY48SxfwFEhq4wGuWEbIbeSZmfEHDAFWN3kNa1p8NR+xQqc1vqzUCHg6VDaBVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=SSXrqxxM; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="SSXrqxxM"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137dd4cc208so821278c88.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 05:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782477370; cv=none;
        d=google.com; s=arc-20260327;
        b=YObd0pphIOr3+ylKFd39+FW/YYR3h2hP37dItXLu2GCXndoAbMtvYA6ZY6rGq3Mhnk
         AuHUD+UC20xCu+9Oj6tumZy+DmUHfiVPMW3PZfUtEbJUN19nT7Quv4DCT46BTARUGDrJ
         j8ewDMDStB5OpljHLklvi7qCzBKEa3b2Cn3QtbPbPmkfevTw+3zBwk/BvZ426+JexIlb
         /0cZWacqGIcld/mCKP0k//IUp6Ens/CBACaOK1M2s4KSy+Pu+zgPtW6B37jLUEVWRiZv
         MWCHoO8xv2rMgxyjUA5z20MGVRgV91RYspcarXQ5FwVBAsWWSzASGc6h4eK7hBZklqBk
         s3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RNRapNIbgEWc1qE0oAblhftV4Ixuf8iVdDHBIQcCDGM=;
        fh=Re9ERgqGMUoVN+r11yZw5u/2kx6fWSH5d58zS3VhGx0=;
        b=Bqd6jb5e/r7V3GiFHUr/Nh6kvx4ter4fNDCNM+mcsJ/NXy51AvJwf4tiFAH4Ww/kBC
         8zXZrIiiI2pnlmrA3cHF0jYwIIiuLvcnPUY2ryooEqyS71WGdEsCyFk07qtyKYcJ308K
         R40IeBJEAs5quMOCpCVegATEK3P64ZTTJvOZCQWVmRIVM1c+UlyaR1cg4JzkZbsfZTKo
         1ZeHaVaw+EhRDuuvJseC5feSQrTMosAC/Y9qX0EqL6OuEW6c76PqHioET64H+VfGQ6Do
         a9X+rbpH42ORjKOMJ4UHk8B09c44IOiutCx2C0KZrCi6GGEABDdAGWilcfPCEVWEIugS
         97Ew==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1782477370; x=1783082170; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RNRapNIbgEWc1qE0oAblhftV4Ixuf8iVdDHBIQcCDGM=;
        b=SSXrqxxMCoFbDsfP/GDdM6asHdp5/udJM4sPoKMXloEk1FQ24TDqVICFQuv+VxMUwv
         Wpk8grBtkqWRMA+W1wvWdLm5/Gz65ZmESybUrUIGXbv6m5NZTUv+4JqRORI8S+1wV10q
         3PcvVabRPw0uHh1d73kOjlDFy9829KBPZytqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477370; x=1783082170;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNRapNIbgEWc1qE0oAblhftV4Ixuf8iVdDHBIQcCDGM=;
        b=i9lW3xxp+D+8uCWnOGwVYSUUegXOJJPdphLFBl1/wcZKhrAKlDgzs0lOaOOL4mG2J/
         EEXeYM0o9dvtaYJMMmbZFD9bo9Psf1fFuyDnb2rdGq5jKknWUqfmrjgCUfrp9ezqX582
         i5FI3GhDPaPKUF8YI7Q3bf6+CtiQAwPMzuA0qsnFyIG+ytvpd77ET9fFVKdclCxNXZ5N
         DeZSX++kJP8WQK9KIh/p2NfCDdSCsyITm1AXLQgUT/AAiocVS7Cf2h0HXfUfkozlIzUp
         YTzFSp15/7JBBAsodE6Fz/yRdfM3GpAdBdp2ZQ1u1MmfwyG7kdXTbNTbGZyAWAwpl8Lj
         fWxg==
X-Gm-Message-State: AOJu0YyLjyEmdkWOwEsmuTHS1W0DV0Km2B8wwNi9MF9ztzr1KV3z6HsJ
	9dQCf3HvQbJ747y6zsrMfI0HdRtzkZYMwcJ4OUMsCchKlKzj1IOqBRSGrHQX96APMef9gXQP448
	+1F0ON+8zaZcROP6D6ZkcbO6MNTOUTz2F0Jrng6Dmexb4SCxVSXlTVXs=
X-Gm-Gg: AfdE7ckRh+2VYbRjpWUL+3vPwFpD3cEBUvHdP9I2bcLbFZyw1q/WFGdxbtJnLSdNcv9
	Rq0esl3xz6ftWNxEkV6YoK9DDeP2Waa/zZIWkvtoAjeoW7uQWK+sl7w8/yZa9cu/8mXGjfnIvbq
	E3XoPaGwOC9bMhPXFXqhJsGXxV0zO6B49VWxyRjpFg1S1BOoAArP9Ar2/QM/gIPizmaj3nJ/7Vw
	HPK5yYz7rI/dDTak7eFzS4fv9bTTdba7yFd/30UAW6xnJRnFnwueqRjNWOT3FwMVcQrgIa2
X-Received: by 2002:a05:7022:921:b0:133:39b9:9720 with SMTP id
 a92af1059eb24-139db9d6539mr4878111c88.16.1782477370067; Fri, 26 Jun 2026
 05:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 26 Jun 2026 21:35:58 +0900
X-Gm-Features: AVVi8Ce41uwHSMadiZ8PDPjqrMXL4UQljyTkmMkYTMc1PrzS386SBvNPE8vz88Y
Message-ID: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
Subject: m68k: 68000 port for megadrive
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello m68k people,

I'm not going to send patches* for this but I thought it'd at least be
funny to someone.
I've used my DeviceTree enabled version of the 68000 code to do a
quick port to the megadrive.

https://github.com/LinuxMD/linuxmd (screenshot is near the end)

Cheers,

Daniel

* Although I'm working on pushing the nolibc bits so it can produce
nommu friendly ELFs.
