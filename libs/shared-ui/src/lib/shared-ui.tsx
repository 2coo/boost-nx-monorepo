import styles from './shared-ui.module.css'

/* eslint-disable-next-line */
export interface SharedUiProps {}

export function PageHeader() {
  return (
    <div className={styles['container']}>
      <h1>Welcome to SharedUi!</h1>
    </div>
  )
}
