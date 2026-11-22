Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344952;
	b=eoqb5bMZ8FKfPyHgJT2RN0Q9+oOyUM8qezqixREFBU50CwvvmJAjghBHwXNuBQLrBVEa
	 pphaVBn12t1xlNupfA8VsHycg/vQqhVt5p4XnP/bPm+TMQKW5MhzAKv0y7qab8JC45iu5
	 oZvqtEUUU8sk27ZIVKtm1SKuCFNO1qap2u5EY7VYIW2RsoQWzpwYPnnfQFPLftmfsN9hS
	 rJzraeYjXm0gIdGUKN53XnxpPWF5Tz6gX0G14dAx5xByJ6EeJDqffPMUCTMbgQPsclFjg
	 lpi+Zhw/b2didhr8DiPPfb7CMa0YLFP9LuvlU3X3oqWAHtj8V+zY0P7lHXOmprmlBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
	b=EAWTaXPDw+IhLS8P+lhL/+tU+SlxobqrXlGRlCFWtujndSFaf9rzjRVxP4qrpeC1pp8w
	 nFtHiielPiTB/paGRk2Y4D/DGe+p4sLi8MQHefbLepdcbe7ageiUycCTAeJ3Le8xgBt3D
	 0bF9X6G6bOadFb1dWVwHQxjjym6xxLQMw+4Ib6fBkfYPxmjYsqggjhykR/vGC8R8qw/vh
	 9yG3aqmQJ3oE7yq5oNbIlb01uX7nyCKV/SPL0YAOFqupFNk/VcBm7WXtPBC26lKq0t482
	 iVdtw16PQ06Yuag85B2VLRcA+VB+jbhdj6ZFmEPX6lZV0kmmirsQMA9GkvURebGSvkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSQKkZti;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75522606A32A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Nov 2026 10:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75522606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSQKkZti
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so1310658f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Nov 2026 02:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795344951; x=1795949751; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
        b=MSQKkZtiMMVhuwfk0yv6iUX4peVCglOfPoXA0/IF4MQXr1iaDRzNbg+USTIk3bfe0i
         mdLk5qIDgvp1smGXMAMpXzlnSNUTXsPRMuEJMhoGDPZlBWvoN5lZ+pAg6RBSJ6+BRpIo
         qPiss9R3HWbBsDITAbQEWj3oYPGIlBlnPGW6UoVTrR9VcE3VdbFlWbtEBnqXbF/4Cp++
         9uuz2lc0wsiy8WdpGaKl8TxdRhEqnWyWaP1IkB4j47cgvkNYGkexO6YO7Pk86JFLDpyl
         1FSrmCp62banQ7VShDYAcmeGFpNpGI+iYNZIY2Tg1ovyVvzErmKxCCwT1bIDFonW2WNG
         fSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795344951; x=1795949751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
        b=eC7yUH84taNRbX6QAuHuJU1vUfya8Ai8+qIj3g+mBRpkN/g0QJscJeBRTGUMBYNN6L
         2w3aCFfwbcso6KdF7TKqFsdQ+cloOlyPCuOHCfAsW4yd5xmOiiTTPPHLz3noe9f96nN1
         G48Ms7XE6lCzr6CSxNVdyN4xoVA9rOrwZPCW7gPwIFGLFAwc6KJSYKtcQkVJrkosnO7Z
         c5btOADMt6/RpRd7Damii/iodFfDxw1iAwRYL/9/AjFF9c4jhMak2L5bgtG7fE89DdLE
         zZn2U3LhHChAIvuQ5rZCwGPWSLk2bjZrMbqC9CCc8KLZB5KoEHnuyTBnFnxs6e0bIq8a
         sJFQ==
X-Forwarded-Encrypted: i=1; AL+hErHG1h5rlY5diLxfkmxfeNf0SoJGmpR/rmw9CFURHaqVMQOiwHE6S/xj9KAjniJiDHh/oePabg7r5uTw@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/w1vMgBBicdts6Dr+PlGKnmMYA7aAtZgo90jxpq0Rq/m93a/Vh
	vpWOH9M3c2/ZxbpwtNk74LCMGVsXhvnFjpuZTQHv7HjXneQMXn7/kyTX
X-Gm-Gg: AZFdTZe/4l4TyfQt8iN2Apnl7gX6klIhhm+jh1Mr44ptFBa4aMXS6rV3eRkM8sVV9Ku
	yIrmgX3jSziZWHYwDC2KvYisnyPeiB5WcAkkJ5lnktxDwvoKaLTJB0Y0Q9Xl5EkrYcWayrYi4Ox
	/30nw3A5BF0K8gV0Xp8cgdnHYaJTazRVWtvwn6/hr9M46iuIbxmCT+k4X5WGrmpHs6F3wbTvRus
	qsh8DdTS++qvY2PvdQfDD2geJuuCaznVSjOpZi7edf0kjcN+QadEGVtx2hKNs566u/HvDppcptf
	K3K/EOjqKZ4w3Vb7FvioDnijtHuc23lPSfJsDaIethG4ajO0/zD+DdvRP5fFm9zvBcDR/RSOZQO
	p/GgJcDdRY2+YimT9+66Zf6m52Ing9IFdSZ3daV3CNrNUk4ZP1F+jeXxShf9Z4iawRmnsZh7rA2
	wXSCsXz8zwD7EtG68cjjj7RirNE+B//82v0OJoLd3+cPqDEdcDpaNQD+J0XpKV8G29UhlcvIqml
	NrLENNRdBVJ+XKeQGp0MKRv+DTmkcPLt6ir5d2U4c6TG4HLIeE5TbzonMkoNs1ttiu5UY1mYkFi
	gsMaWU44Jj+FWmuiwcI20ipY5OVgDU9vUiR6c8SVBQOzXQ6OEHv13E9sqg/wWd0wOvOt5ENvcEA
	/pzqZkmR2KqMk
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr167070605e9.20.1795344950469;
        Sun, 22 Nov 2026 02:55:50 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:a189:e169:38a5:6f86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm111316355e9.1.2026.11.22.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:55:50 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] m68k: Add 060 PCR info to /proc/cpuinfo
Date: Sun, 22 Nov 2026 11:55:49 +0100
Message-ID: <20261122105549.84343-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Thu, Nov 19, 2026 at 09:35:54PM +0900, Daniel Palmer wrote:
> Apparently the rev6 060 can overclock to ~100MHz
> but mine seems to only manage ~60MHz (I wonder if some part
> of it that other OSes don't use doesn't actually like
> overclocking...).
>
> I started to wonder if I actually had a rev6 and noticed
> you can't see this info from /proc/cpuinfo right now.

Tested on v7.4-rc3 plus this series, with a multi-platform config
and with a 060-only one. Both kernels build without
warnings, boot to userspace and run fine.

# cat /proc/cpuinfo
CPU:            68060
MMU:            68060
FPU:            68882
Clocking:       49.1MHz
BogoMips:       98.20
Calibration:    491008 loops
PCR:            0x04300601 (ID 0x0430, revision 6, superscalar)

Tested-by: Paolo Pisati <p.pisati@gmail.com>
-- 
bye,
p.
