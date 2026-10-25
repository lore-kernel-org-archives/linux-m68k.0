Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896646;
	b=kolYy640KEPALMjj88SMrmHul8xHlgTGDHfkck6xs7GsF8VYDMKtSj88wtE4GCJsE96/
	 SPPsWdbjDNt2S0q74yb8FUa3018rx5O1MG/LaK1fwnXbVyoiU7oCF/SIEURhf/hwUoXrt
	 w+HyqZsy1oI7hD13vHfXW3dlqEO42fKKgcy3s3hdiePz67untPk7u5/zuJ/FwBktalkQ7
	 lh+gYumaPbEB9jtgG67KtWAnIY26d9A1iw5ddDq+kxwRmo0PHolHtMHeTOFtU4cPPNdb2
	 2O5bmqNY6ZS1gCUsqSZXGZ6XyE0cbFCS9KFbQttmqfamgXWWfwgLhC8a6ik19FR2e/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896646;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	b=I0pydwq7SgEaX/4oQnDEqk/L6Phv5hnJFEGKxbrBhu+qfvbF9eGadInrxo4LtaBbWyPa
	 nMqt55ASdyXZ9gElu+um49m91e0hlmovse8y0XR6js+snmO9FJS5Thn2ubvTP5GK2dNQq
	 +1UeIKUECrO6BkPxvrp+mle6H7X4rWoaN0i+B5toHpI6qQZDLPO+qwMYQDlq8geQgnx5w
	 qMEohVwqzMQoJz+oMxc/RhrmDizJMUxmH1AYMBJ1B+THxwZvm4YkjwpheNh5AEtlWDXl6
	 wavp0BL7jSpcDJ2iS0EIQyfrFjlDWfXm4pAjhClxx1yw1qz0lk5QvCtZ1FAHPrecAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEuUv254;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851F606A31B
	for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Oct 2026 02:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9851F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEuUv254
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D2740E44;
	Sun, 25 Oct 2026 02:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37A31F01825;
	Sun, 25 Oct 2026 02:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792896645;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GEuUv254RxWiGvc1ZfA8OuASlp3VzmFho55zr6Z99JfC2yL/MdsXFtWDWp8UpeR97
	 j7YDUv7bm+wCB5kSHtucT2AzCdBtoKDY+yr5NHcHHL+MmbWhomszjw04j8DzFP881f
	 6tM8/MHtYJTGKL6T4motNvCaejoz/0eiBGnrak5a6I0ohYPiIaDzi1Avq+cCg44mEa
	 vuUebXY8tqAr+8vzNUkACtMvMcvPLqMI48S98mkMzYncr6XiLGsUGd9So3i3rDNcpI
	 F/Uo5krwZDWpNq9bvMFGWRODAeVJ1rfMlaAM/SCLn5ZochWizVzXPwYOLd7FImCo+o
	 mMQSm+oEadclw==
From: netdev-bot+sinfo@kernel.org
To: Daniel Palmer <daniel@0x0f.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Denis Ahrens <denis@h3q.com>
Subject: Re: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x
 PORT/CA registers
Date: Sun, 25 Oct 2026 02:50:44 +0000
Message-ID: <179289664421.3327.13269797237144711675@kernel.org>
In-Reply-To: <20261025024514.802862-1-daniel@0x0f.com>
References: <20261025024514.802862-1-daniel@0x0f.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
