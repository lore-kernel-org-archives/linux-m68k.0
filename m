Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611733556A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765914590; cv=none; b=OEdibozYnjACB0BYtpJcAT8QakeKbQjHCZaypLcQkOoZUOLBcrVRb/vjPKnuZJLe25Hn/8MuclyOyFFXeKkqiiwoiZOrtcnuiG/Hn98zZA+qHAll6OaTuRrg54xIJvt7zhz7apCWloQxF3luUcLLnTAp7gKWHo6hqRsJG/sybHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765914590; c=relaxed/simple;
	bh=3FmpwD62IJUHDHR/I5ZYeJX9OsU87aYBt8XiqHww6dc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZetF8wVNcG83QMtGiqgpAHBOjHxJlK2Fv669o8U9TXsZ4KPf7PgE/Fy5geVfWUa4NvQ4REtRdxRJB1C7qrbZv5jeg/+5uaEt3O4MYwTpBamGGVcPBBrilkfCL8lkQ8u515TsfkSOYerX5skIb5V7l3o55+m9kJ8hWzzH5t6VS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wRGHMtmb; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wRGHMtmb"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11FA06017F;
	Tue, 16 Dec 2025 19:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B246DC4CEF1;
	Tue, 16 Dec 2025 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765914586;
	bh=3FmpwD62IJUHDHR/I5ZYeJX9OsU87aYBt8XiqHww6dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wRGHMtmbERcpA6VCd7VdIJSxWeMMV3MufiaICwJM2JxmUckd4/ZDamGIp98xLnU7Z
	 uebteatGutNpSVaCbIbB+LV6ZmqtugE23SVf1F34zvnJxpCPzgUWlQUA1tUgyCpZP6
	 5X1mflTa7f2NerKLz8PKwSVTiVXS5dHxJMQ76kh8=
Date: Tue, 16 Dec 2025 11:49:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 bpf@vger.kernel.org, Rich Felker <dalias@libc.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Dinh Nguyen <dinguyen@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Gary Guo <gary@garyguo.net>, Geert Uytterhoeven
 <geert@linux-m68k.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Guo Ren <guoren@kernel.org>, Hao Luo
 <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>, Jiri Olsa
 <jolsa@kernel.org>, Jonas Bonn <jonas@southpole.se>, KP Singh
 <kpsingh@kernel.org>, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Martin KaFai
 Lau <martin.lau@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Stafford
 Horne <shorne@gmail.com>, Song Liu <song@kernel.org>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Yonghong Song
 <yonghong.song@linux.dev>, Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH v5 0/4] Align atomic storage
Message-Id: <20251216114945.df117ce1f176dd7752244cfb@linux-foundation.org>
In-Reply-To: <cover.1765866665.git.fthain@linux-m68k.org>
References: <cover.1765866665.git.fthain@linux-m68k.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Dec 2025 17:31:05 +1100 Finn Thain <fthain@linux-m68k.org> wrote:

> This series adds the __aligned attribute to atomic_t and atomic64_t
> definitions in include/linux and include/asm-generic (respectively)
> to get natural alignment of both types on csky, m68k, microblaze,
> nios2, openrisc and sh.
> 
> This series also adds Kconfig options to enable a new run-time warning
> to help reveal misaligned atomic accesses on platforms which don't
> trap that.
> 
> The performance impact is expected to vary across platforms and workloads.
> The measurements I made on m68k show that some workloads run faster and
> others slower.

Looks nice, thanks.

I don't know which tree this is aimed at.  I grabbed a copy for
mm.git's mm-nonmm-unstable tree, can drop it again if this pops up in
linux-next via another route.
