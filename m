Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522881;
	b=QTN7iWWft7o+Hi1iavW5KJD6teCk8Wv/Rndvm5Ws6IN84kLXDE7GxLg1+LygVESnVHrY
	 pTyciHU3meGqUqNFBlRcG8EpiOyVVdttbFlE+C6sCdVOeKV6N2TtYRwr5/9+bYPYaJcKA
	 qLAv1L9P1qd+3SysQ0u+3WSJ9iQN8tnsqYemioCGUgPdR6P8vXIhC1bl8YyVZReloLIQH
	 a1o+sedtRAPOg03SQyLWc57eZjoQbkMVlVIc7XYJy53UfS+QY3lgO2gUuBpAMEIRsdUfJ
	 bOLxsig8BTs7nj/iDB1qVEU3dOmPHXbCLq3L+13KvCmMOGpA+xSRKv7kAUvoUS4yUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522881;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Xbx0lkyEH1jdcxoxNWiUBHwzx5Nfc6UsYeAtIegNYWU=;
	b=ychV+qQ8cYmEaUy4FVCrNa/dyC9XbPUE7M1m59tCSM/K0bw8CfzXzYwWlavMlQdLbBtG
	 5J9msghfV2rk+xMSz9cpmYxjH+Zt+gE8KPN+qTEj4Tk6BMmU0ogyTf8JBpOZMgzLvSSQC
	 JocxB+K8+TxcWhILjHWh2pt3AkR0qLNPXjjWEOEUN9S5KfilWuKNtVPBQBETs3ZTDt+OG
	 WSScI21XkppslKJrGpEEtTCyWAJVzQGxRn+vEN4TtEMQ1rbCza07kVyKOOmCSQfp1xdRI
	 Yb7i6huaCY7bEajFr4wDFyRAawUH2iFFHbeVUnmdQ89k4e3cFpdpYzQK3K3jGwtZG4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCfPVofO;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF7606A332
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 12:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EF7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCfPVofO
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68DEC62633;
	Tue, 24 Nov 2026 12:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92B01F000D8;
	Tue, 24 Nov 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522879;
	bh=Xbx0lkyEH1jdcxoxNWiUBHwzx5Nfc6UsYeAtIegNYWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oCfPVofOR7AyS5BgzpJPI6ZqzVkNhjF6heECkK614Qdu12AGmAYvkmO4citmEYUrL
	 YKQRVDD/iEuviAPdHU9P7ZfI41qR3nSZdPZ2aSyrLIR2bLTBRyXFU8jmJHSL3gTVvI
	 JNnv2bnBscguIwc4ojDIzcnmO6RSgqlGiQ/SV71kPGO7ORCI6Ojb63uilcdbu34ALD
	 BIb4cRMV2+FkzaxZUkMy6mP21RP/BY7hRtLeej6onklOYYpM2ovQ2EgsJhz6Bq/iOi
	 eLIfj89/PuxOaPQxRuma3+1moTgXHJGMTRhpOaXYKrBqEd+xp/TSb66aeZZpHvyB64
	 Yy4pTn7E7F6+g==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 24 Nov 2026 12:20:16 +0000
Subject: [PATCH v6 6/7] rust: make exports.o depend on the headers
 generated for it
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-build-speedup-v6-6-141a4f861c67@kernel.org>
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>
Cc: ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=ljs@kernel.org;
 h=from:subject:message-id; bh=19Xc0y+KWUOL2pPe/Y3BojjXrN9DHW/cJgclSTiky2k=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZG/5LG4Q9KBQ385rM0lab5v7uzNROi6K8DXIZ3LGvF
 0T8fiTaUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgImEsTIydC7u8gsyCfr5ht2p
 dy97FBeT0s/LjtflDjzr/pd2VWlyPyPDlTfPtilnWbAZCAo6iOf7ixhv9GE0nmcRvU0vVVT39Xd
 uAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

rust/exports.c includes the exports_*_generated.h listing the symbols of
the core, bindings, kernel and helpers objects, but this is not expressed
in its Makefile.

This worked previously because the headers are always-y targets, and make
prepare built all of the rust crates first, which is an implicit
dependency.

Fix this as it is a dependency of the subsequent commit.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 rust/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..cee016cd8d32 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -728,6 +728,11 @@ endef
 $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
 	+$(call if_changed_rule,rust_cc_library)
 
+# The exported symbol lists are generated from the crates' objects.
+$(obj)/exports.o: $(obj)/exports_core_generated.h \
+    $(obj)/exports_bindings_generated.h $(obj)/exports_kernel_generated.h \
+    $(if $(CONFIG_RUST_INLINE_HELPERS),,$(obj)/exports_helpers_generated.h)
+
 # Disable symbol versioning for exports.o to avoid conflicts with the actual
 # symbol versions generated from Rust objects.
 $(obj)/exports.o: private skip_gendwarfksyms = 1

-- 
2.56.1

