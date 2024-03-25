import React from "react"
import "./style.css"

export const Icon = () => (
	<div className="icon-box">
		<img className="nav-icon" src="/assets/icon-circle.png" />
		{process.env.NODE_ENV === "development" && (
			<p className="dev-text">Dev Environment</p>
		)}
	</div>
)

export const Logo = () => {
	return (
		<div className="logo">
			<img src="/assets/logo-orangebg.png" alt="U.P. Lions Serve logo" />
			{process.env.NODE_ENV === "development" && (
				<p className="dev-text">Dev Environment</p>
			)}
		</div>
	)
}
